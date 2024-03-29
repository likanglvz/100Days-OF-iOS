//
//  main.m
//  三对象相互包含
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"
#import "C.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        A *a = [A new];
        B *b = [B new];
        C *c = [C new];
        
        a.b = b;//a = 1,b = 2;c = 1;
        b.c = c;//a = 1;b = 2;c = 1;
        c.a = a;//a = 2;b = 2;c = 1;
        
        [a release];//a = 1,b = 2;c = 1;
        [b release];//a = 1,b = 1,c = 1;
        [c release];//c = 0;a = 0;b = 0;
        
        
    }
    return 0;
}
