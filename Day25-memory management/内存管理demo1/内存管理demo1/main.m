//
//  main.m
//  内存管理demo1
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    /*当对象被alloc出来并赋值给一个指针对象时，计数会自动加1*/
    Person *p0 = [Person alloc];
    /*下面这种操作在非arc下计数不会加1*/
//    Person *p1 = p0;
    /*retain会使一个对象计数加1，返回对象本身，self*/
    Person *p1 = [p0 retain];
    NSLog(@"p0的引用计数为%ld",[p1 retainCount]);
    
    [p0 release];
    p0 = nil;
    
    NSLog(@"p0的引用计数为%ld",[p0 retainCount]);
    [p1 release];
    p1 = nil;
    NSLog(@"p0的引用计数为%ld",[p0 retainCount]);
    NSLog(@"p0.age=%d",[p0 age]);
    return 0;
}
