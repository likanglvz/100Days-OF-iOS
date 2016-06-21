//
//  NSString+CountNumber.m
//  字符串的分类实现
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NSString+CountNumber.h"

@implementation NSString (CountNumber)
+(int)countInString:(NSString*)str
{
    int count = 0;
    for (int i = 0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if (c<='9'&&c>='0') {
            count++;
        }
    }
    return count;
}
-(int)countInCurrentString
{
    return [NSString countInString:self];
}
-(BOOL)isURL
{
//    if ([self hasPrefix:@"http://"]) {
//        return YES;
//    }
//    return NO;
    return [self hasPrefix:@"http://"];
}
@end
