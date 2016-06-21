//
//  Car.m
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Car.h"

@implementation Car
@synthesize speed = _s;
@synthesize wheels = _wheels;
-(void)test
{
    NSLog(@"speed=%d,wheels=%d",self->_s,self.wheels);
}
@end
