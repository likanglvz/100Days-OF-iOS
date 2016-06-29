//
//  main.m
//  类成员变量的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"


int main(int argc, const char * argv[]) {
    Employee *e = [Employee new];
    [e setSalary:200];
    [e show];
    return 0;
}
