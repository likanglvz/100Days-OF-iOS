//
//  NSSet+Show.m
//  NSSet分类
//
//  Created by AppleUser on 16/4/6.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "NSSet+Show.h"

@implementation NSSet (Show)


-(void)show{
    for (id tem in self) {
        NSLog(@"%@",tem);
    }
}
@end
