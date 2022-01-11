#include "ros/ros.h"
#include "plumbing_head/hello.h"

namespace hello_ns
{
    void MyHello::run()
    {
        ROS_INFO("run 函数执行.....");
    }
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");   //解决中文乱码问题
    ros::init(argc,argv,"hello_head");
    hello_ns::MyHello myHello;
    myHello.run();
    
    return 0;
}
