//
//  A.m
//  类方法之load和initialize用法
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "A.h"

@implementation A
+(void)load
{
    NSLog(@"类方法load被调用了");
}
+(void)initialize
{
    NSLog(@"类方法initialize方法被调用了");
}
+(void)show
{
    NSLog(@"show...");
}
@end
