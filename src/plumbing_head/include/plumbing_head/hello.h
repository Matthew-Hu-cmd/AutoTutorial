#ifndef _HELLO_H
#define _HELLO_H                //设置头文件保护
/*
    声明 namespace
            |--class
                |--run函数
*/

namespace hello_ns
{
    class MyHello
    {
    private:                        //private 放置类变量
        /* data */
    public:                         //public 放置类函数成员
        void run();
    };
    
}

#endif