//
//  Cat.m
//  普通对象的copy
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Cat.h"
#import "Dog.h"
@implementation Cat
- (id)copyWithZone:(nullable NSZone *)zone
{
    Cat *c = [[Cat allocWithZone:zone]init];
    c.name = [_name copy];
    c.age = _age;
    c.dog = [_dog copy];
    return c;
}
-(NSString*)description
{
    NSString *s = [NSString stringWithFormat:@"name=%@,age=%d,dog=%@",_name,_age,_dog];
    return s;
}
@end
