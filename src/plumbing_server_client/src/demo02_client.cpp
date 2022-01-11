#include "ros/ros.h"
#include "plumbing_server_client/AddInts.h"
/*
    客户端：提交两个整数，并处理响应的结果（直接打印）
        1.包含头文件
        2.初始化ROS节点
        3.创建节点句柄
        4.创建客户端对象
        5.提交请求并处理响应
        6.spin（）
        节点中不管需不需要spin，都给我spin

        实现参数的动态提交：
            1.格式：rosrun XXXX XXXX 12 34
            2.节点执行时，需要获取命令中的参数，并组织进request
        问题：如果先启动客户端，那么会请求异常，不希望这种情况出现
        需求：如果先启动客户端，不要直接抛出异常，而是挂起,等服务器启动后在正常启动
*/
int main(int argc, char *argv[])
{
    //优化实现，获取命令中的参数,如果main调用的时候跟了两个参数，则argc=3，表示有三个参数，第一个是程序名，第二个和第三个是我主动传入的参数
    if(argc != 3)
    {
        ROS_INFO("Wrong argument number!\ninput again!");
    }
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"daBao");
    ros::NodeHandle nh;
    ros::ServiceClient client = nh.serviceClient<plumbing_server_client::AddInts>("addInts");
    //严格按照服务的情况来进行设置
    //首先要能创建一个AddInts对象
    plumbing_server_client::AddInts ai;
    //组织请求
    ai.request.num1 = atoi(argv[1]);//利用传进来的参数作为num1、num2的值
    ai.request.num2 = atoi(argv[2]);
    //处理响应
    //调用判断服务器状态的函数
    client.waitForExistence();
    //如果有多个服务的话
    // ros::service::waitForService("addInts");//传参是服务的话题
    bool flag = client.call(ai);//函数调用产生的结果会返回一个bool类型变量来说明是否服务有了响应
                                //同时，会把response封装进ai这个对象
    if (flag)
    {
        ROS_INFO("response succssful!");
        //get result!
        ROS_INFO("response result = %d",ai.response.sum);
    } else {
        ROS_INFO("response failed!");
    }
    

    return 0;
}
