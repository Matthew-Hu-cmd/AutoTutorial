#include"ros/ros.h"
#include"tf2_ros/static_transform_broadcaster.h"
#include"tf2/LinearMath/Quaternion.h"
#include"geometry_msgs/TransformStamped.h"
/*
    静态坐标变换发布方:
        发布关于 laser 坐标系的位置信息 

    实现流程:
        1.包含头文件
        设置编码
        2.初始化 ROS 节点
        3.创建静态坐标转换广播器
        4.创建坐标系信息
        5.广播器发布坐标系信息
        6.spin()
*/
int main(int argc, char *argv[])
{
    // 实现流程:
    //     1.包含头文件
    //     设置编码
    setlocale(LC_ALL,"");
    //     2.初始化 ROS 节点
    ros::init(argc,argv,"static_brocast");
    ros::NodeHandle nh;
    //     3.创建静态坐标转换广播器
    tf2_ros::StaticTransformBroadcaster broadcaster;
    //     4.创建坐标系信息


    geometry_msgs::TransformStamped tfs;
    //---设置头信息
    tfs.header.seq = 100;
    tfs.header.stamp = ros::Time::now();     //获取时间戳
    tfs.header.frame_id = "base_link";       //相对坐标系关系中被参考的那一个(小车主体base_link)
    //---设置子级坐标系
    tfs.child_frame_id ="laser";
    //---设置相对与父级坐标系的偏移量
    tfs.transform.translation.x = 0.2;
    tfs.transform.translation.y = 0.0;
    tfs.transform.translation.z = 0.5;
    //---设置四元数：将欧拉角数据转换成四元数
    //向该对象设置欧拉角，这个对象可以将欧拉角转换为四元数

    tf2::Quaternion qtn;//创建四元数对象
    qtn.setRPY(0,0,0); //raw/pitch/yaw,单位是弧度制，如果静态安装的话需要设置这个
    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();


    //     5.广播器发布坐标系信息
    broadcaster.sendTransform(tfs);
    //6.spin()
    ros::spin();
    return 0;
}
