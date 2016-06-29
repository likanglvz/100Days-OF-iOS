//
//  main.m
//  ARC的工作原理
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
/*
 1.在arc环境中，不可以使用retainCount,retain,release方法
 2.在arc环境中，对象指针默认都是__strong类型的强指针
 3.弱指针：不影响对象是否被回收，但指针所指向的对象如果被释放，则会自动被赋值为nil;
 */
int test(int argc, const char * argv[]) {
    
        __strong Dog *d1 = [Dog new];//count = 1
//        NSLog(@"count = %ld",[d1 retainCount]);
//        [d1 release];
//        Dog *d2 = [d1 retain];
       __strong Dog *d2 = d1;
//        d1 = nil;
//        d2 = nil;
        NSLog(@"%@",d2);
        
   
//    d1 = nil;
    return 0;
}
int main(int argc, const char * argv[])
{
    Dog *d1 = [Dog new];
    __weak Dog *d2 = d1;
//    d2 = nil;
    d1 = nil;//对象不在了
    NSLog(@"%@",d2);
}