#!/usr/bin/env python2
from xmlrpc.client import ResponseError, Server
import rospy
from plumbing_server_client.srv import AddInts,AddIntsRequest,AddIntsResponse
from plumbing_server_client.srv import Serial,SerialRequest,SerialResponse

'''
    服务端：解析客户端的请求，产生响应
        1.导包
        2.初始化节点
        3.创建服务对象
        4.处理逻辑编写(callback)
        |--需求：模拟串口接受数据，数据头为0X5A,结束位为0XA5
        |--允许的数据输入格式为xx,xx,xx,xx,xx这样
        5.spin()
'''
def HexList2IntList(list):
    for i in range(len(list)):
        list[i] = int(list[i],base=16) #每个十六进制的字符串都转换为十进制数字
    return list
    
def doNum(request):
    #request.InputData 是一个只有一个元素的list["xxxxx"]
    #dataRecv 是一个’str’
    # dataRecv_list = list(dataRecv)
    #dataRecv_list被转化成了一个有多个string元素的list["xx","xx","xx"]，且每个元素两位
    dataRecv = request.InputData[0]
    dataRecv_list = dataRecv.split(',')
    # print(dataRecv_list)
    print(dataRecv_list)
    if (dataRecv_list[0]=='5A')&(dataRecv_list[-1]=='A5'): #如果接收到的数的数据头、尾均正确
        int_list = HexList2IntList(dataRecv_list)  #已经由十六进制str变成十进制int
        actual_recv_list = int_list[1:-1]   #新生成一个list，把头尾去掉
        str_final = ''.join([str(x) for x in actual_recv_list])
        rospy.loginfo("serial recive success!,recived string: %s",str_final)
        pass

    else:
        rospy.loginfo("Wrong data bits, input again!")
    response = SerialResponse(request.InputData)    #暂时先这么写着
    return response


if __name__ == "__main__":
    rospy.init_node("serial_server")
    Server = rospy.Service("serila_recv",Serial,doNum)
    rospy.loginfo("-------The serial server is on now!-------\n demanding data...")
    rospy.spin()