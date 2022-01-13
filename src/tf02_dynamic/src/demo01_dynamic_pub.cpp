#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "tf2_ros/transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2/LinearMath/Quaternion.h"
/* 
    发布方：需要订阅到乌龟的位姿信息，转换成相对窗体的坐标关系并发布
    准 备
        topic：/turtle1/pose
        message:/turtlesim/Pose

    流程：
        1.头文件包含，用到谁就包含谁
        2.设置编码、初始化，NodeHandle
        3.创建订阅者对象，订阅/turtlesim/Pose
        4.回调函数处理订阅的信息：将位子信息转换成坐标相对关系并发布{important}
        spin（）
 */
void doPose(const turtlesim::Pose::ConstPtr& pose)
{
    //获取位姿信息，转换成坐标系相对关系（核心），并发布
    //a.创建发布对象：
    static tf2_ros::TransformBroadcaster pub;
    //b.组织被发布的数据
    geometry_msgs::TransformStamped tfs;
    tfs.header.frame_id = "world";
    tfs.header.stamp = ros::Time::now();
    tfs.child_frame_id = "turtle1";
    //坐标系偏移量的设置
    tfs.transform.translation.x = pose->x;
    tfs.transform.translation.y = pose->y;
    tfs.transform.translation.z = 0;
    //坐标系四元数的设置
    //pose->theta 实际上就是乌龟的偏航角，没有横滚与俯仰角度
    //实际上欧拉角就是 0 0 theta

    //创建欧拉角对象
    tf2::Quaternion qtn;
    qtn.setRPY(0,0,pose->theta);

    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();

    //c.发布
    pub.sendTransform(tfs);
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"dynamic_pub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/turtle1/pose",100,doPose);
    return 0;
}
