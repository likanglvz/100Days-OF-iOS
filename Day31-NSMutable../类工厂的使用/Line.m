//
//  Line.m
//  类工厂的使用
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Line.h"

@implementation Line
-(void)draw
{
    NSLog(@"I'm %@!",self.name);
}
-(id)initWithName:(NSString*)name
{
    _name = name;
    return self;
}
@end
