//
//  A.m
//  三对象相互包含
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "A.h"

@implementation A
-(void)dealloc
{
    NSLog(@"a没了");
    [_b release];
    [super dealloc];
}
@end
