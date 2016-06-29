//
//  Student.m
//  自定义对象放入数组
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Student.h"

@implementation Student
-(NSString*)description
{
    return [NSString stringWithFormat:@"name=%@,age=%d",_name,_age];
}

-(BOOL)isEqual:(id)object
{
    /*object 就是某一个Student对象，*/
    Student *stu = (Student*)object;
    if ([self.name isEqualToString:stu.name]&&(_age ==stu.age)) {
        return YES;
    }
    return NO;
}


+(Student*)studentWithName:(NSString*)name andWithAge:(int)age
{
    Student *s = [[self alloc]init];
    s.name = name;
    s.age = age;
    
    return s;
}
@end
