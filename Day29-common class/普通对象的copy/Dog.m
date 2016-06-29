//
//  Dog.m
//  普通对象的copy
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(NSString*)description
{
    NSString *s = [NSString stringWithFormat:@"dog.name=%@",_name];
    return s;
}
-(id)copyWithZone:(NSZone *)zone
{
    Dog *d = [Dog allocWithZone:zone];
    d.name = _name;
    return d;
}
@end
