//
//  A+ACategory.m
//  类方法之load和initialize用法
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "A+ACategory.h"

@implementation A (ACategory)
+(void)load
{
    NSLog(@"A分类中的load");
}
+(void)initialize
{
    NSLog(@"A分类中的initialize");
}
@end
