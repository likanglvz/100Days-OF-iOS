//
//  main.m
//  代码块的练习
//
//  Created by AppleUser on 16/3/31.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    typedef void (^test)(int n);
    test printLine = ^(int n){
        for (int i=0; i<n; i++) {
            NSLog(@"----------");
        }
        
    };
    printLine(5);
    
    
    
    
    return 0;
}
