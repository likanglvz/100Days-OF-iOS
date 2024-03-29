//
//  main.m
//  Class对象的使用
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
int main(int argc, const char * argv[]) {
    Animal *a = [Animal new];
    Class c1 = a.class;
    Class c2 = Animal.class;
    NSLog(@"%d",c1==c2);
    
    Class f1 = a.superclass;
    Class f2 = NSObject.class;
    NSLog(@"%d",f1==f2);
    NSLog(@"name=%@",NSStringFromClass(f1));
    
    NSString *s1 = @"123";
    Class cs1 = NSString.class;
    Class cs2 = s1.class;
    NSLog(@"两个字符串的class对象相等吗？%d,cs1的类名为：%@,cs2的类名为：%@",cs1==cs2,NSStringFromClass(cs1),NSStringFromClass(cs2));
    NSString *tmp = [[cs2 alloc]init];
//    tmp = [[__NSCFConstantString alloc]init];
    
    /*判断一个对象是否是某一个类的实例对象*/
    BOOL isMember = [@"abc" isMemberOfClass:cs1];
    
    NSLog(@"%d",isMember);
    /*判断对象是否是某个类的实例，或者是某一个类的子类的实例对象*/
    BOOL isKind = [@"abc" isKindOfClass:cs1];
    NSLog(@"%d",isKind);
    
    
    Cat *cat = [Cat new];
    NSLog(@"%d",[cat isKindOfClass:c1]);
    NSLog(@"%d",[cat isMemberOfClass:c1]);
    return 0;
}
