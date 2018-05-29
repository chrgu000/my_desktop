#基于flask实现网络共识
import hashlib  #信息安全加密
import json  #互联网传递信息的格式
#import datetime #时间
import time
from urllib.parse import urlparse #url编码解码
from  uuid import uuid4 #签名
import requests #请求
from flask  import Flask,jsonify,request #网络的框架


class Blockchain:
    def __init__(self): #初始化作用
        self.chain=[]  #区块的列表
        self.current_transactions=[] #交易的列表
        self.nodes=set()#节点，与别的电脑连接
        #创建第一个区块None
        self.new_block(previous_hash=1,proof=100)
    def register_node(self,address):#在集合中增加其他电脑的节点
        parsed_url=urlparse(address) #地址注册
        if parsed_url.netloc:#可以链接网络的情况
            self.nodes.add(parsed_url.netloc)
        elif parsed_url.path:
            self.nodes.add(parsed_url.path)
        else:
            raise ValueError("url无效")




    def new_block(self,proof,previous_hash=None): #新建一个区块，需要计算才能追加
        if len(self.chain)==0:
            block = {
                "index": len(self.chain) + 1,  # 索引
                "timestamp": "123456789",  # 时间
                "transactions": self.current_transactions,  # 交易
                "proof": proof,  # 计算力的凭证
                "previous_hash": previous_hash or self.hash(self.chain[-1])  # 上一块哈希
            }

        else:
            block={
            "index":len(self.chain)+1 ,#索引
            "timestamp":time.time(),#时间
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
        block_string=json.dumps(block,sort_keys=True).encode()
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
    def valid_proof(last_proof,proof,last_hash):#验证工作量正确，
        guess=f'{last_proof}{proof}{last_hash}'.encode() #计算的字符串编码
        guess_hash=hashlib.sha256(guess).hexdigest() #哈希计算
        return guess_hash[:4]=="0000"  #调整计算难度,hash挖金矿



    def valid_chain(self,chain): #区块校验
        last_block = chain[0]
        current_index = 1

        while current_index < len(chain):
            block = chain[current_index]
            print(f'{last_block}')
            print(f'{block}')
            print("\n-----------\n")

            if block['previous_hash'] != self.hash(last_block):
                print("哈希验证")
                return False


            if  self.valid_proof(last_block['proof'], block['proof'], last_block['previous_hash']):
                print("算力验证")
                return False

            last_block = block
            current_index += 1

        return  True
    def  resolve_conflicts(self): #冲突，一致性算法的一种
        #取得互联网中最长的链来替换当前的链表
        neighbours=self.nodes #备份节点   127.0.0.1    192.168.1.1
        new_chain=None #新的链表
        max_length=len(self.chain)#最长的长度，先保存当前结点的长度
        print(max_length)
        for node  in neighbours: #刷新每个网络节点，取得最长更新
            response=requests.get(f'http://{node}/chain') #取得其他节点的区块链
            print(f'http://{node}/chain')
            print(response.json())
            if response.status_code==200:
                length=response.json()["length"] #取得长度
                chain=response.json()["chain"]#取得区块链表
                print(length,chain)

                #刷新保存最长的区块链与完成校验
                if length>max_length and  self.valid_chain(chain):
                #if length > max_length:
                    print("OK")
                    max_length=length
                    new_chain=chain
                else:
                    print("NO")

        if new_chain: #判断是否为空
            self.chain=new_chain#更新成功
            return True

        return False


app = Flask(__name__) #flask的网络框架
#为当前结点制造一个独一无二的地址
node_id=str(uuid4()).replace("-","")#模拟钱包的地址
print("钱包地址",node_id) #a619161f-69f0-4968-9a9e-09f415253c1e
blockchain=Blockchain()#构造一个区块链

@app.route('/')
def index_page():
    return '欢迎来到达达电子货币系统，韭菜你好! flask网络工作正常！'

@app.route('/chain', methods=['GET']) #显示区块
def chain():
    response={
        "chain":blockchain.chain,  #区块信息
        "length":len(blockchain.chain)  #区块长度
    }
    return jsonify(response),200 #返回网络信息，200网络相应码



@app.route('/transactions/new',methods=["POST"]) #post传递交易信息
def new_transactions():
    values=request.get_json() #传递交易信息
    required=["sender","recipient","amount"] #交易的信息，付款，收款方，金额
    if not all(k in values for k in required):
        return "小伙子你的交易信息有误，本大爷不执行",400 #交易失败
    #索引，创建一个交易
    index=blockchain.new_transaction(values["sender"],values["recipient"],values["amount"])
    response={"message":f"交易被增加到区块{index}"}
    return jsonify(response),201

@app.route('/mine',methods=["GET"])
def mine():
    lastblock=blockchain.last_block#取得区块链表最后一个区块
    proof=blockchain.proof_of_work(last_block=lastblock) #挖矿延时，创建新的区块
    blockchain.new_transaction(sender="0",recipient=node_id,amount=10)#系统奖励达达比
    previous_hash=blockchain.hash(lastblock)#记录上一块的哈希
    block=blockchain.new_block(proof,previous_hash)#创建一个新的区块

    #描述区块的基本信息
    response={
        "message":"New Block Forged",
        "index":block["index"],
        "transactions":block["transactions"],
        "proof":block["proof"],
        "previous_hash":block["previous_hash"]
    }
    return  jsonify(response),200 #返回信息


#网络同步
@app.route('/nodes/reslove',methods=["GET"])
def nodes_reslove():
    replaced=blockchain.resolve_conflicts()#共识算法用最长的替换当下
    if replaced:
        response={
            "message":"区块链信息已经被同步",
            "new_chain":blockchain.chain
        }
    else:
        response = {
            "message": "当前区块链是权威最长无需替换",
            "chain": blockchain.chain
        }
    return jsonify(response), 200 # 返回信息


@app.route('/nodes/register',methods=["POST"])
def nodes_register():
    values=request.get_json()#抓取网络信息,链接其他节点
    nodes=values.get("nodes")#读取节点
    print(nodes)
    if  nodes is None:
        return "Error:没有找到其他节点信息",400
    for  node in nodes:
        blockchain.register_node(node) #注册网络节点
    response={
         "Message":"新的网络节点列表已经追加",
        "total_nodes":list(blockchain.nodes) #所有节点
    }
    return jsonify(response), 201  # 返回信息


if __name__ == '__main__':
    app.run(host="127.0.0.1",port=8005)



