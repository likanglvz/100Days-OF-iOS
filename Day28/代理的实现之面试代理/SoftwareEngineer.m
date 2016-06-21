//
//  SoftwareEngineer.m
//  代理的实现之面试代理
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SoftwareEngineer.h"

@implementation SoftwareEngineer
-(void)tellMeAboutYourself
{
    NSLog(@"我有五年工作经验，年薪至少20万我会考虑加盟贵公司");
}
-(NSString*)description
{
    return @"工程师";
}
@end
