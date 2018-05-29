#基于flask实现网络共识
import hashlib  #信息安全加密
import json  #互联网传递信息的格式
import datetime #时间
from urllib.parse import urlparse #url编码解码
from  uuid import uuid4 #签名
import requests #请求
from flask  import Flask,jsonify,request #网络的框架



class Blockchain:
    def __init__(self): #初始化作用
        self.chain=[]  #区块的列表
        self.current_transactions=[] #交易的列表
        self.nodes=set()#节点
        #创建第一个区块None
        self.new_block(previous_hash=1,proof=100)

    def new_block(self,proof,previous_hash=None): #新建一个区块，需要计算才能追加
        block={
            "index":len(self.chain)+1 ,#索引
            "timestamp":datetime.datetime.now(),#时间
            "transactions":self.current_transactions,#交易
            "proof":proof, #计算力的凭证
            "previous_hash":previous_hash or  self.hash(self.chain[-1]) #上一块哈希
        }
        self.current_transactions = []  # 开辟新的区块，交易需要被清空
        self.chain.append(block)#增加一个区块
        return  block

    def new_transaction(self,sender,#付款方
                        recipient, #手下款
                        amount): #交易金额
        #新的交易
        self.current_transactions.append({
            "sender":sender,
            "recipient":recipient,
            "amount":amount
        })
        return  self.last_block["index"]+1

    @staticmethod #类的静态函数
    def hash(block):
        #m模块进行哈希处理  #json.dumps(block,sort_keys=True)区块处理为字符串
        block_string=json.dumps(block,sort_keys=True).encode("utf-8")
        return hashlib.sha256(block_string).hexdigest()#返回块的哈希值

    @property
    def last_block(self): #代表取最后一个区块
        return self.chain[-1]


  #挖矿依赖于上一个模块
    def  proof_of_work(self,last_block):#挖矿获取工作量证明
        last_proof=last_block["proof"] #取出计算力的凭证
        last_hash=self.hash(last_block)#取出哈希

        proof=0  #循环求解，
        while self.valid_proof(last_proof,proof,last_hash) is False: #循环计算
            proof+=1

        return proof

    @staticmethod
    def valid_proof(last_proof,proof):#验证工作量正确，
        guess=f'{last_proof}{proof}'.encode("utf-8") #计算的字符串编码
        guess_hash=hashlib.sha256(guess).hexgigest() #哈希计算
        return guess_hash[:6]=="000000"  #调整计算难度


    def valid_chain(self,chain): #区块校验
        last_block=chain[0]#从第一块开始校验
        current_index=1 #索引为1
        while current_index<len(chain):#循环每一个区块进行校验
            block=chain[ current_index] #取得当前块
            if block["previous_hash"]!=self.hash(last_block):#区块校验
                return False

            #创建一个区块依赖算力计算，校验区块的计算算力
            if not self.valid_proof(last_block["proof"],
                                    block["proof"],
                                    last_block["previous_hash"]):
                return False

            last_block=block#循环
            current_index+=1

        return True



    def  resolve_conflicts(self): #冲突，一致性算法的一种
        #取得互联网中最长的链来替换当前的链表
        neighbours=self.nodes #备份节点   127.0.0.1    192.168.1.1
        new_chain=None #新的链表
        max_length=len(self.chain)#最长的长度，先保存当前结点的长度

        for node  in neighbours: #刷新每个网络节点，取得最长更新
            response=requests.get(f'http://{node}/chain') #取得其他节点的区块链
            if response.status_code==200:
                length=response.json()["length"] #取得长度
                chain=response.json()["chain"]#取得区块链表

                #刷新保存最长的区块链与完成校验
                if length>max_length and  self.valid_chain(chain):
                    max_length=length
                    new_chain=chain

        if new_chain: #判断是否为空
            self.chain=new_chain#更新成功
            return True
        else:
            return False



