//
//  Person.m
//  拥有三个对象型成员变量
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"
@interface P1:NSObject

@end

@interface P1 ()

@end

@implementation P1

@end

@implementation Person
-(void)show
{
    P1 *p = [P1 new];
    
}
-(void)dealloc
{
    NSLog(@"person没了");
    [_m release];
    [_c release];
    [_d release];
    [_name release];
    [super dealloc];
}
@end
