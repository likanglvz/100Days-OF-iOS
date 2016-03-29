//
//  A.m
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "A.h"
#import "C.h"
@implementation A
-(void)dealloc
{
    NSLog(@"B被清零了");
    [_b release];
    [super dealloc];
}
@end
