#! /usr/bin/env python
"""  
    调用 service 服务在窗体指定位置生成一只乌龟
    流程:
        1.导包
        2.初始化 ros 节点
        3.创建服务客户端
        4.等待服务启动
        5.创建请求数据
        6.发送请求并处理响应
"""
#1.导包
import rospy
from turtlesim.srv import Spawn, SpawnRequest, SpawnResponse

if __name__ == "__main__":
    # 2.初始化 ros 节点
    rospy.init_node("turtle_spawn_p")
    # 3.创建服务客户端
    client = rospy.ServiceProxy("/spawn",Spawn)
    # 4.等待服务启动
    client.wait_for_service()
    # 5.创建请求数据
    req = SpawnRequest()
    req.x = 1.0
    req.y = 1.0
    req.theta = 3.14
    req.name = "turtle2"
    # 6.发送请求并处理响应
    try:
        response = client.call(req)
        rospy.loginfo("乌龟创建成功，名字是:%s",response.name)
    except Exception as e:
        rospy.loginfo("服务调用失败....")
