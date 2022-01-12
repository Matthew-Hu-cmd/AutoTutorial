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
        5.spin()
'''
def doNum(request):
    rospy.loginfo("message recived!\n\t%s",request.InputData)
    response = SerialResponse()

    return response


if __name__ == "__main__":
    rospy.init_node("serial_server")
    Server = rospy.Service("serila_recv",Serial,doNum)
    rospy.loginfo("-------The serial server is on now!-------\n demanding data...")
    rospy.spin()