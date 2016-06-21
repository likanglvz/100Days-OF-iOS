//
//  Employee.m
//  类成员变量的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Employee.h"

@implementation Employee
/*成员变量的set方法*/
-(void)setSalary:(double)salary
{
    if (salary<0||salary>100000) {
        _salary = 2000;
        return;
    }
    _salary = salary;
}
-(void)setManager:(BOOL)manager
{
    if (manager) {
        if (_salary<10000) {
            return;
        }
    }
    _manager = manager;
}

/*成员变量的get方法*/
-(double)salary
{
    return _salary;
}
-(BOOL)isManager
{
    return _manager;
}
-(void)show
{
    NSLog(@"manager=%d,salary=%f",_manager,_salary);
}
@end
