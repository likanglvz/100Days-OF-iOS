//
//  main.m
//  协议的使用
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
int main(int argc, const char * argv[]) {
    A *a = [A new];
    if ([a respondsToSelector:@selector(test2)]) {
        [a test2];
    }
    
    return 0;
}
