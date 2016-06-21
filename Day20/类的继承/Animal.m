//
//  Animal.m
//  类的继承
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(void)setLegNum:(int)legNum
{
    _legNum = legNum;
}
-(void)setAge:(int)age
{
    _age = age;
}
-(void)say
{
    
    NSLog(@"我是一个动物总类，legNum=%d",_legNum);
}
@end
