//
//  NSString+Statistics.m
//  homework1
//
//  Created by 李康 on 16/3/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NSString+Statistics.h"

@implementation NSString (Statistics)
+(int)numInString:(NSString*)str{
    int count = 0;
    for (int i = 0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if (c<='9'&&c>='0') {
            count++;
        }
    }
    return count;
    
}
+(int)letterInString:(NSString*)str{
    int count = 0;
    for (int i = 0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if ((c<='Z'&&c>='A')||(c<='z'&&c>='a')) {
            count++;
        }
    }
    return count;
    
}
+(int)symbolInString:(NSString*)str{
    int numCount=[self numInString:str];//数字的个数
    int letterCount=[self letterInString:str];//字母的个数
    int count = 0;
    for (int i = 0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if (c<=255&&c>=0) {
            count++;
        }
    }
    return count-numCount-letterCount;
    
}
+(int)chineseInString:(NSString*)str{
    int numCount=[self numInString:str];//数字的个数
    int letterCount=[self letterInString:str];
    int symbolCount=[self symbolInString:str];
    return str.length-numCount-letterCount-symbolCount;
    
    
}

@end
