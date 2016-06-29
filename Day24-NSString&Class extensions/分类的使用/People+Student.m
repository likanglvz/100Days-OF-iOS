//
//  People+Student.m
//  分类的使用
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "People+Student.h"

@implementation People (Student)
-(void)setHeight:(int)height
{
    _height = height;
}
-(int)height
{
    return _height;
}
-(void)show
{
    NSLog(@"我是学生分类，name=%@,height=%d",_name,_height);
}
-(void)test
{
    NSLog(@"分类中的test");
}
@end
