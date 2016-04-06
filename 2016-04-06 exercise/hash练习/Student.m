//
//  Student.m
//  hash练习
//
//  Created by AppleUser on 16/4/6.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Student.h"

@implementation Student
-(NSUInteger)hash{
    return _name.length+_sid;
    
}
-(BOOL)isEqual:(id)object
{
    Student *stu = (Student*)object;
    if ([self.name isEqualToString:stu.name]&&(_sid ==stu.sid)) {
        return YES;
    }
    return NO;
}
+(id)studentWithName:(NSString *)name andWithSid:(int )sid{
    Student *stu=[Student new];
    stu.name=name;
    stu.sid=sid;
    return stu;
}

@end
