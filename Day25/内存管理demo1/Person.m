//
//  Person.m
//  内存管理demo1
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)dealloc
{
    [super dealloc];
    NSLog(@"self.age=%d对象没有了",_age);
    
}
@end
