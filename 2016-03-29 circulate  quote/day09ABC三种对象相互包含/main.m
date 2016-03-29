//
//  main.m
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        A*a=[A new];
        B*b=[B new];
        C*c=[C new];
        
        a.b=b;
        a.c=c;
        b.c=c;
        b.a=a;
        c.a=a;
        c.b=b;
        
        
        [a release];
        [b release];
        [c release];
        
    }
    return 0;
}
