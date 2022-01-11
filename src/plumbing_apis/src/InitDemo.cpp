#include "ros/ros.h"
#include "std_msgs/String.h" //普通文本类型的消息
#include "sstream"

int main(int argc, char *argv[])
{
    // setlocale(LC_ALL, "");  //解决中文乱码问题
    setlocale(LC_CTYPE, "zh_CN.utf8");
    /** ROS初始化函数。
 *
 * 该函数可以解析并使用节点启动时传入的参数(通过参数设置节点名称、命名空间...) 
 *
 * 该函数有多个重载版本，如果使用NodeHandle建议调用该版本。 
 *
 * param argc 封装实参个数（n+1） 传出的第一个是文件自身
 * param argv 封装参数的数组，将argc封装进一个字符串数组
 * param name 节点名称，需要保证其唯一性，不允许包含命名空间
 * param options 节点启动选项，被封装进了ros::init_options
 *
 * 返回：void
 * 
 *使用：1.argc与argv的使用
    如果按照ROS中的特定格式传入实参，那么ROS可以加以使用，比如用来设置全局数，给节点重命名
    2.options 的使用
    节点名称需要保证唯一，不能重复启动一个节点
        利用options参数的ros::init_options::AnonymousName这样每次都会启动都会生成一个随机数在节点名字之后，
        达到不重名的目的
 */
    ros::init(argc,argv,"InitDemo",ros::init_options::AnonymousName);
    // ROS_INFO("我真的是烦死了");
    //发布消息前创建节点句柄,也可用来创建命名空间
    ros::NodeHandle nh;
    
    
//实例化 发布者 对象(模板)
/*
    泛型: 发布的消息类型
    参数1: 要发布到的话题
    参数2: 队列中最大保存的消息数，超出此阀值时，先进的先销毁(时间早的先销毁)
    参数3：latch（可选）
        如果设置为 true 会保存发布方的最后一条消息，并且新的订阅对象连接到发布方时
        发布方会将这条消息发送给订阅者

    使用：
        latch为 true 的使用
        以静态地图发布为例：方案一：可以使用固定频率发送地图数据，但是效率低；
                        方案二：地图发布对象latch为true 每当订阅者链接时，
                        将地图信息数据发送给订阅者，只发送保存的一次
                        提高效率
*/ 
    ros::Publisher demo_apis_pub = nh.advertise<std_msgs::String>("",10, true); //最好以后就用latch = true吧
    //编写发布逻辑并发布数据
    //10HZ pub
    //创建被发布的消息
    std_msgs::String msg;
    //frequency
    ros::Rate rate(1);
    int count =0;
    ros::Duration(3).sleep();
    //pub in a while-loop
    while (ros::ok())
    {
        count++;
        //实现字符串拼接数字
        std::stringstream ss;
        ss << "hello ---" << count;
        // msg.data = "hello"
        msg.data = ss.str();
        if (count <= 10)
        {
            demo_apis_pub.publish(msg);
            //添加日志
            ROS_INFO("发布的数据：%s",ss.str().c_str());
        }
        rate.sleep();

        ros::spinOnce();//官方建议处理回调函数的写法
    }
    return 0;
}

