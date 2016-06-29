//
//  Person.m
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize age = _age;
@synthesize height = _height;
@synthesize weight = _weight;
@synthesize name = _name;
//下面一行代码相当于下面的两个方法
//-(void)setAge:(int)age
//{
//    _age = age;
//}
//-(int)age
//{
//    return _age;
//}
-(void)test
{
    NSLog(@"age=%d,height=%d,name=%@",_age,_height,_name);
}
@end
