#include "ros/ros.h"
#include "plumbing_server_client/AddInts.h"    //头文件的名字是和srv目录下的srv文件同名的
/*
    服务端实现：解析客户端提交的数据，运算后产生相应
        1.包含头文件
        2.初始化ROS节点
        3.创建节点句柄
        4.创建服务对象
        5.处理请求，产生相应
        6.spin（）
        节点中不管需不需要spin，都给我spin
*/

bool doNums(plumbing_server_client::AddInts::Request &request,
            plumbing_server_client::AddInts::Response &response)   //服务的回调函数返回的是bool类型的值，告诉我响应的结果到底是成果还是失败
{
    //1.处理请求
    int num1 = request.num1;
    int num2 = request.num2;
    ROS_INFO("收到的请求数据:num1 = %d， num2 = %d",num1,num2);

    //2.产生响应
    int sum = num1 + num2;
    ROS_INFO("求和结果:sum = %d",sum);
    response.sum = sum;

    return true;
}
int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    //     2.初始化ROS节点
    ros::init(argc,argv,"heiShuiCompany");//节点名称保持唯一
    //     3.创建节点句柄
    ros::NodeHandle nh;
    //     4.创建服务对象
    ros::ServiceServer server = nh.advertiseService("addInts",doNums);
    ROS_INFO("service is avaliable now!");
    //     5.处理请求，产生相应----> 在回调函数中实现
    //     6.spin（）
    ros::spin();
    //     节点中不管需不需要spin，都给我spin
    return 0;
}
