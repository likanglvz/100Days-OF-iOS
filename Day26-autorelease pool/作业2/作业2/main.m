//
//  main.m
//  作业2
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *src = @"abcssss EFAAAG";
    NSRange range = [src rangeOfString:@" "];
    NSString *s1 = [[src substringToIndex:range.location]uppercaseString];
    NSString *s2 = [[src substringFromIndex:range.location]lowercaseString];
    NSString *s3=@"";
    for (long i = s2.length-1; i>=0; i--) {
        NSString *tmp = [s2 substringWithRange:NSMakeRange(i, 1)];
        s3 = [s3 stringByAppendingString:tmp];
    }
    src = [s3 stringByAppendingFormat:@"%@",s1];
    NSLog(@"src=%@",src);
    
    return 0;
}
