//
//  HR.m
//  代理的实现之面试代理
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "HR.h"

@implementation HR
-(void)interView
{
    NSLog(@"%@",self.delegate);
    if ([self.delegate respondsToSelector:@selector(tellMeAboutYourself)]) {
        [self.delegate tellMeAboutYourself];
    }
    /*判断某个对象是否遵守某个协议*/
    if ([self.delegate conformsToProtocol:@protocol(InterView)]) {
        NSLog(@"%@遵守了协议",self.delegate);
    }
    
}
@end
