//
//  Car.m
//  循环引用引发的问题
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Car.h"

@implementation Car
-(void)test
{
    NSLog(@"car的test");
}
-(void)dealloc
{
    NSLog(@"car没了");
    [_master release];
    [super dealloc];
}
@end
