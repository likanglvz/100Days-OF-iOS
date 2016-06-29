//
//  Teacher.h
//  多态的好处
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Person.h"

@interface Teacher : Person
{
    double _salary;
}
-(void)setSalary:(double)salary;
-(double)salary;
-(void)education;
-(void)say;
@end
