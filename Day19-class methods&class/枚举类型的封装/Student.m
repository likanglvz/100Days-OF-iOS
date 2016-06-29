//
//  Student.m
//  枚举类型的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)setScore:(float)score
{
    _score = score;
}
-(float)score
{
    return _score;
}

-(void)setSex:(Sex)sex
{
    _sex = sex;
}
-(Sex)sex
{
    return _sex;
}
@end
