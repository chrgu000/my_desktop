import time #时间
import queue #队列
from  multiprocessing.managers import  BaseManager #分布式管理器


class QueueManager(BaseManager):#创建类继承分布式管理器
    pass
QueueManager.register("get_task_queue") #任务队列
QueueManager.register("get_result_queue")#结果队列
print("客户端开始")
client=QueueManager(address=("127.0.0.1",55000),authkey=b"123456")
client.connect()#链接服务器
for  i  in range(10):
    n=client.get_task_queue().get()
    print("客户端取出数据",n)
    time.sleep(1)
    client.get_result_queue().put(str(n)+"你妹")

print("客户端结束")

#100个任务，要对应100个结果  一致性
#协同性，就是3个客户端一起完成100个任务，不会重复



#共识，中心化编程里面，客户端都要链接服务器，返回结果。
#记账，发给所有人，通过所有人的验证。作恶说服51%的节点。



