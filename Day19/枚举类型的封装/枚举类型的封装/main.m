//
//  main.m
//  枚举类型的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//
#import "Student.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    Student *s = [Student new];
    [s setSex:Boy];
    [s setScore:89];
    NSLog(@"score=%f",[s score]);
    return 0;
}
