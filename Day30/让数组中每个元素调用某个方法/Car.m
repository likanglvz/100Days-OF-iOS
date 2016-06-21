//
//  Car.m
//  让数组中每个元素调用某个方法
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Car.h"

@implementation Car
-(void)run
{
    NSLog(@"本车速度为:%d",_speed);
}
+(Car *)carWithSpeed:(int)speed
{
    Car *car = [[Car alloc]init];
    car.speed = speed;
    return car;
}
@end
