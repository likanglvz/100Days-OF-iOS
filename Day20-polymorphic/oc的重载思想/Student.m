//
//  Student.m
//  oc的重载思想
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)setAge
{
    _age = 20;
}
-(void)setAge:(int)age andWithName:(NSString*)name
{
    _age = age;
    _name = name;
}
-(void)setAge:(int)age
{
    _age = age;
}
@end
