//
//  C.m
//  三对象相互包含
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "C.h"

@implementation C
-(void)dealloc
{
    NSLog(@"c没了");
    [_a release];
    [super dealloc];
}
@end
