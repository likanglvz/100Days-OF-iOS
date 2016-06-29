//
//  main.m
//  函数指针复习
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
void test(int a)
{
    NSLog(@"test函数中参数为%d",a);
    {
        /*用来提前回收内存中不使用的变量*/
        NSLog(@"xxxx");
    }
}
void test1(int a)
{
    NSLog(@"test1函数中参数为%d",a);
}
void show(void(*p)(int))
{
    p(100);
}

int main(int argc, const char * argv[]) {
    void (*p)(int) = test;
    void (*p1)(int) = test1;
    typedef void(*testP)(int);
    testP p2 = test1;
    p2(1000);
    show(p1);
    return 0;
}
