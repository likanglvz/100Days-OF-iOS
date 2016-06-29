//
//  B.m
//  三对象相互包含
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "B.h"

@implementation B
-(void)dealloc
{
    NSLog(@"b没了");
    [super dealloc];
}
@end
