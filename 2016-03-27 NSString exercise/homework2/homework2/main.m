//
//  main.m
//  homework2
//
//  Created by 李康 on 16/3/27.
//  Copyright © 2016年 李康. All rights reserved.
//把一个字符串类似于abc EFG 转换为gfe ABC;

#import <Foundation/Foundation.h>
#import "NSString+Transform.h"
int main(int argc, const char * argv[]) {
   NSString *str=@"abqwwqeqeqeqed HHW";
    NSString *newChar=[NSString transformNsstring:str];
    NSLog(@"转换过后的字符串是%@",newChar);
    return 0;
}
