#include "ros/ros.h"
#include "dynamic_reconfigure/server.h"
#include "dynamic_demo/dynamic_demoConfig.h"
/*
    动态参数服务端：
        1.包含头文件
        2.初始化操作
        3.创建服务端对象、
        4.回调函数解析修改后的数据
        5.spin()
*/
// 获取并解析动态参数
void cb(dynamic_demo::dynamic_demoConfig &config, uint32_t level)
{
    ROS_INFO("Vcmd edited by dynamic_reconfigure:%f",config.Vcmd);
    ROS_INFO("base_speed edited by dynamic_reconfigure:%f",config.base_speed);
    ROS_INFO("angle_gain edited by dynamic_reconfigure:%f",config.angle_gain);

}
int main(int argc, char  *argv[])
{
        // 2.初始化操作
        setlocale(LC_ALL,"");
        ros::init(argc,argv,"dynamic_server");
        // 3.创建服务端对象
        dynamic_reconfigure::Server<dynamic_demo::dynamic_demoConfig> server;
        // 4.回调函数解析修改后的数据
        // void setCallback(const boost::function<void 
        // (dynamic_demo::dynamic_demoConfig &, uint32_t level)> &callback)
        server.setCallback(boost::bind(&cb,_1,_2));
        // 5.spin()
        ros::spin();
    return 0;
}
