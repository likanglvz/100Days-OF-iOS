//
//  main.m
//  作业1
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+NSStringExt.h"
void test1()
{
    NSString *s1 = @"159";
    NSString *s2 =@"23";
    int result = s1.intValue-s2.intValue;
    NSString *s = [NSString stringWithFormat:@"%d",result];
    NSLog(@"%@",s);
}
void test2()
{
    NSString *src = @"123-456-789-1111";
    NSString *dest = @"";
    for (int i = 0; i<src.length; i++) {
        unichar c = [src characterAtIndex:i];
        if (c>='0'&&c<='9') {
            dest = [dest stringByAppendingFormat:@"%C",c];
        }
    }
    NSLog(@"%@",dest);
}

int main(int argc, const char * argv[]) {
    NSString *src = @"abcd789dkjfal;fdabcuioeabcooo";
    int count = [src calculateSubStringCount:@"abc"];
    NSLog(@"count=%d",count);
    test1();
    test2();
    return 0;
}
