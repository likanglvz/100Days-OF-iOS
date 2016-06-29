//
//  main.m
//  自动释放池
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
int main(int argc, const char * argv[]) {
    NSString *s = nil;
    /*池子0*/
    @autoreleasepool {
        Employee *e = [[[Employee alloc]init]autorelease];
//        [e retain];
//        [e autorelease];不正确
//        [e release];错误

        e.name = @"老王";
        /*池子1*/
        @autoreleasepool {
            Employee *e1 = [[[Employee alloc]init]autorelease];
            e1.name = @"小王";
        }
        Employee *e2 = [[[Employee alloc]init]autorelease];
        e2.name = @"小丽";
        s = [NSString stringWithFormat:@"%@",@"abc"];
    }
    
    Employee *e3 = [[[Employee alloc]init]autorelease];
    e3.name = @"小丽妹妹";
    NSLog(@"%@",s);
    return 0;
}
