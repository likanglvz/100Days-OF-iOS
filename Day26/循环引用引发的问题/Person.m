//
//  Person.m
//  循环引用引发的问题
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"
#import "Car.h"
@implementation Person
-(void)show
{
    [self.car test];
}
-(void)dealloc
{
    NSLog(@"司机没了");
//    [_car release];
    [super dealloc];
}
@end
