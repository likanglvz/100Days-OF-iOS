//
//  Person.m
//  多态的好处
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setAge:(int)age;
{
    _age = age;
}
-(int)age
{
    return _age;
}

-(void)setName:(NSString*)name
{
    NSLog(@"setName:方法被执行了");
    _name = name;
}
-(NSString*)name
{
    return _name;
}
-(void)say
{
    NSLog(@"我是高富帅,age=%d,name=%@",_age,_name);
}
@end
