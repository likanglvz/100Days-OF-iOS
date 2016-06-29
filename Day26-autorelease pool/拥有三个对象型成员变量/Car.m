//
//  Car.m
//  拥有三个对象型成员变量
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Car.h"

@implementation Car
-(void)dealloc
{
    NSLog(@"car没了");
    [super dealloc];
}
@end
