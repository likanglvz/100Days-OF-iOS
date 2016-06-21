//
//  Employee.h
//  类成员变量的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject
{
    double _salary;
    BOOL _manager;
}
/*成员变量的set方法*/
-(void)setSalary:(double)salary;
-(void)setManager:(BOOL)manager;

/*成员变量的get方法*/
-(double)salary;
-(BOOL)isManager;

/*查看员工的信息*/
-(void)show;
@end
