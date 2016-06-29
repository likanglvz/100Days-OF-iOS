//
//  NSSet+ShowStu.m
//  可变set--NSMutableSet
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NSSet+ShowStu.h"

@implementation NSSet (ShowStu)
-(void)show
{
    for (id tmp in self) {
        NSLog(@"%@",tmp);
    }
}
@end
