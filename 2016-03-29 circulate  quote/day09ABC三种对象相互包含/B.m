//
//  B.m
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "B.h"
#import "A.h"
@implementation B
-(void)dealloc
{
    NSLog(@"C被清零了");
    [_c release];
    [super dealloc];
}
@end
