//
//  main.m
//  Sel的使用
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [Person new];
//    [p test1];
//    SEL sel = @selector(test1);
    [p performSelector:@selector(test1)];
    [Person performSelector:@selector(test2)];
    
    [p performSelector:@selector(test3:) withObject:@"abc"];
    [p performSelector:@selector(test4:andWithName2:) withObject:@"first" withObject:@"second"];
//    [p performSelector:@selector(test5:andWithAge:) withObject:@"name" withObject:5];
    NameAndAge *na = [NameAndAge new];
    na.name = @"abc";
    na.age = 3;
    
    SEL s = NSSelectorFromString(@"test7:");
    if ([p respondsToSelector:s]) {
        [p performSelector:s withObject:na];
    }
    
    
    
    
    return 0;
}
