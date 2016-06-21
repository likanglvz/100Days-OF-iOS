//
//  main.m
//  拥有三个对象型成员变量
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Mobile *m = [Mobile new];
    Dog *d = [Dog new];
    Car *c = [Car new];
    
    Person *p = [Person new];
    
//    p.name = @"abc";正确
    [p iosSetName:@"abc"];
    NSLog(@"p.name=%@",[p iosGetName]);
    [p setLoser:YES];
    [p isLoser];
    p.c = c;
    p.d = d;
    p.m = m;
    
//    P1 *p1 = [P1 new];
//    [m release];
//    [d release];
//    [c release];
    
    [p release];
    
    p.age = 20;
    int a = 0;
    
    return 0;
}
