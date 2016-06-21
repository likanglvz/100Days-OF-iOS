//
//  Dog.m
//  类方法的使用
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)show
{
    NSLog(@"age=%d",_age);
}
+(void)test
{
    NSLog(@"abcsfajfklsa");
}
+(void)show
{
//    NSLog(@"age=%d",_age);错误
    NSLog(@"这是dog的类方法");
//    [Dog test];正确
    [self test];
}
-(void)setAge:(int)age
{
//    _age = age;
    self->_age = age;
}
-(int)age
{
    [self show];//正确
//    [self age];危险，是递归
//    return _age;
    return  self->_age;
}
@end
