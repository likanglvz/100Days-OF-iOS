//
//  Employee.m
//  自动释放池
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Employee.h"

@implementation Employee
-(void)dealloc
{
    NSLog(@"name=%@的员工没了",_name);
    [super dealloc];
}
@end
