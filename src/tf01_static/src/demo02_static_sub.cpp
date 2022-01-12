/*  
    订阅坐标系信息，生成一个相对于 子级坐标系的坐标点数据，转换成父级坐标系中的坐标点

    实现流程:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 TF 订阅节点
        4.生成一个坐标点(相对于子级坐标系)
        5.转换坐标点(相对于父级坐标系)
        6.spin()
*/
//1.包含头文件
#include "ros/ros.h"
#include "tf2_ros/transform_listener.h"
#include "tf2_ros/buffer.h"
#include "geometry_msgs/PointStamped.h"
#include "tf2_geometry_msgs/tf2_geometry_msgs.h" //注意: 调用 transform 必须包含该头文件

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    // 2.初始化 ROS 节点
    ros::init(argc,argv,"tf_sub");
    ros::NodeHandle nh;             //订阅者的句柄是必须的
    // 3.创建 TF 订阅节点
    // 3-1先创建一个缓存
    tf2_ros::Buffer buffer;
    //再创建一个监听者对象，监听对象可以将订阅的数据存进buffer中
    tf2_ros::TransformListener listener(buffer);

    ros::Rate r(1);
    while (ros::ok())//在实际情况下，坐标点的坐标是动态生成的，所以要在一个寻欢中以一定的频率进行刷新
    {
    // 4.生成一个坐标点(相对于 子级 坐标系)这通常是 障碍物 相对于雷达的位置
        geometry_msgs::PointStamped point_laser;
        point_laser.header.frame_id = "laser";
        point_laser.header.stamp = ros::Time::now();
        point_laser.point.x = 1;
        point_laser.point.y = 2;
        point_laser.point.z = 7.3;
    // 5.转换坐标点(相对于父级坐标系)
        //新建一个坐标点，用于接收转换结果  
        //--------------使用 try 语句或休眠，否则可能由于缓存接收延迟而导致坐标转换失败------------------------
        try
        {
            //先创建一个点对象，用来接收缓存节点
            geometry_msgs::PointStamped point_base;
            //核心代码：将buffer中的信息更新到point_base中
            /*
                调用了 buffer的转换函数 transform
                参数1：被转换的坐标点
                参数2：目标的坐标系（要把坐标点转换到什么坐标系下，比如说是障碍物的话，那么我关心的是它与小车
                也就是base_link之间的关系）
                返回值：输出的坐标点

            ps:必须调用"tf2_geometry_msgs/tf2_geometry_msgs.h"
                订阅数据是一个耗时操作，可能在调用transform转换函数时，坐标系的相对关系还没被订阅到
                ，因此会出现异常，导致无法正确transform
             */

            point_base = buffer.transform(point_laser,"base_link");

            ROS_INFO("转换后的数据:(%.2f,%.2f,%.2f),参考的坐标系是:",
                                point_base.point.x,
                                point_base.point.y,
                                point_base.point.z,
                                point_base.header.frame_id.c_str());

        }
        catch(const std::exception& e)
        {
            // std::cerr << e.what() << '\n';
            ROS_INFO("程序异常.....");
        }


        r.sleep();  
        ros::spinOnce();
    }


    return 0;
}
