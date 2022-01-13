#! /usr/bin/env python2.7
#把python改成python2.7可以解决一些与tf有关的问题
# -*- coding: utf-8 -*-
# 解决中文字符编码的问题
"""  
    该文件实现:需要订阅 turtle1 和 turtle2 的 pose，然后广播相对 world 的坐标系信息

    注意: 订阅的两只 turtle,除了命名空间(turtle1 和 turtle2)不同外,
          其他的话题名称和实现逻辑都是一样的，
          所以我们可以将所需的命名空间通过 args 动态传入

    实现流程:
        1.导包
        2.初始化 ros 节点
        3.解析传入的命名空间
        4.创建订阅对象
        5.回调函数处理订阅的 pose 信息
            5-1.创建 TF 广播器
            5-2.将 pose 信息转换成 TransFormStamped
            5-3.发布
        6.spin
"""
# 1.导包
import rospy
import sys
from turtlesim.msg import Pose
from geometry_msgs.msg import TransformStamped
import tf2_ros
import tf_conversions

turtle_name = ""

def doPose(pose):
    # rospy.loginfo("x = %.2f",pose.x)
    #1.创建坐标系广播器
    broadcaster = tf2_ros.TransformBroadcaster()
    #2.将 pose 信息转换成 TransFormStamped
    tfs = TransformStamped()
    tfs.header.frame_id = "world"
    tfs.header.stamp = rospy.Time.now()

    tfs.child_frame_id = turtle_name
    tfs.transform.translation.x = pose.x
    tfs.transform.translation.y = pose.y
    tfs.transform.translation.z = 0.0

    qtn = tf_conversions.transformations.quaternion_from_euler(0, 0, pose.theta)
    tfs.transform.rotation.x = qtn[0]
    tfs.transform.rotation.y = qtn[1]
    tfs.transform.rotation.z = qtn[2]
    tfs.transform.rotation.w = qtn[3]

    #3.广播器发布 tfs
    broadcaster.sendTransform(tfs)


if __name__ == "__main__":
    # 2.初始化 ros 节点
    rospy.init_node("sub_tfs_p")
    # 3.解析传入的命名空间
    rospy.loginfo("-------------------------------%d",len(sys.argv))
    if len(sys.argv) < 2:
        rospy.loginfo("请传入参数:乌龟的命名空间")
    else:
        turtle_name = sys.argv[1]
    rospy.loginfo("///////////////////乌龟:%s",turtle_name)

    rospy.Subscriber(turtle_name + "/pose",Pose,doPose)
    #     4.创建订阅对象
    #     5.回调函数处理订阅的 pose 信息
    #         5-1.创建 TF 广播器
    #         5-2.将 pose 信息转换成 TransFormStamped
    #         5-3.发布
    #     6.spin
    rospy.spin()

    