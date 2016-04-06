//
//  main.m
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Factory.h"

int main(int argc, const char * argv[]) {
   
    NSObject *s=[Factory getShape:@"Line"];
    NSObject *s1=[Factory getShape:@"Square"];
    NSObject *s2=[Factory getShape:@"Circle"];
    NSLog(@"%@",s);
    NSLog(@"%@",s1);
    NSLog(@"%@",s2);

    return 0;
}






























