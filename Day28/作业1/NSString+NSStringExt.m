//
//  NSString+NSStringExt.m
//  作业1
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NSString+NSStringExt.h"
/*
 @"abc123abcr90ab3"
 
 */
@implementation NSString (NSStringExt)
-(int)calculateSubStringCount:(NSString*)dest
{
    int count = 0;
    NSRange range = [self rangeOfString:dest];
    NSString *subStr = self;
    while (range.location!=NSNotFound) {
        count++;
        subStr = [subStr substringFromIndex:range.location+range.length];
        range = [subStr rangeOfString:dest];
    }
    
    return count;
}
@end
