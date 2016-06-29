//
//  main.m
//  代理的实现之面试代理
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//
/*
 1.定义一个协议，里面有一个方法，用于实现自我介绍
 2.定义两个类（student,engineer）遵守上面协议
 3.定义一个HR类，有一个id类型属性
 4.产生学生和工程师、HR对象，给hr对象的属性赋值为学生或工程师对象，通过hr对象给属性发送消息来执行方法
 
 
 */




#import <Foundation/Foundation.h>
#import "HR.h"
#import "Student.h"
#import "SoftwareEngineer.h"
int main(int argc, const char * argv[]) {
    HR *hr = [HR new];
    Student *s = [Student new];
    hr.delegate = s;
    [hr interView];
    
    SoftwareEngineer *en = [SoftwareEngineer new];
    hr.delegate = en;
    [hr interView];
//    Student *s;
    return 0;
}
