//
//  C.m
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "C.h"
#import "B.h"
#import "A.h"
@implementation C
-(void)dealloc
{
    NSLog(@"A被清零了");
    [super dealloc];
}
@end
