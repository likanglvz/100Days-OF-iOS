//
//  NSString+Transform.m
//  homework2
//
//  Created by 李康 on 16/3/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NSString+Transform.h"

@implementation NSString (Transform)
+(NSString *)transformNsstring:(NSString *)str{
    NSString *tmp = @" ";
    NSRange r = [str rangeOfString:tmp];
    int n=(int)r.location;
    NSString *lowChar=[str substringToIndex:n];
    NSString *upperChar=[str substringFromIndex:n+1];
    NSString *tem=[NSString stringWithFormat:@"%@%@",upperChar.lowercaseString,@" "];
    
    NSString *newChar=[tem stringByAppendingString:lowChar.uppercaseString];
    return newChar;
}
@end
