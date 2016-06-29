//
//  Teacher.m
//  多态的好处
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
-(void)setSalary:(double)salary
{
    _salary = salary;
}
-(double)salary
{
    return _salary;
}
-(void)education
{
    NSLog(@"春蚕到死丝方尽，蜡炬成灰泪始干");
}
-(void)say
{
    NSLog(@"I'm teacher,age=%d,name=%@,salary=%f",_age,_name,self->_salary);
}

@end
