//
//  main.m
//  对象的copy
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 retain:不会产生新对象，是一种指针copy
 */
int main(int argc, const char * argv[]) {
    NSString *s1 = [NSString stringWithFormat:@"hellow"];
    /*
     copy
     {
     //一般情况下，会产生新对象，并返回
        id a = [[self.class alloc]initWith]
        return a;
     //NSString中，返回的还是原来对象本身
        return self;
     }
     
     */
    NSString *s2 = [s1 copy];
    NSLog(@"s1==s2?%d",s1==s2);
    
    NSMutableString *m1 = [NSMutableString new];
    [m1 setString:@"abc"];
    /*可变字符串实现了copy,返回的是新对象*/
    NSMutableString *m2 = [m1 copy];
    NSLog(@"m2=%@,m1==m2?%d",m2,m1==m2);
    
    
    return 0;
}
