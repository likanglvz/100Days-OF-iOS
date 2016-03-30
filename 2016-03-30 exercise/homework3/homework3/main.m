//
//  main.m
//  homework3

//取出字符串类似于@"123-456-789-0000"中的数字部分，组成一个新的字符串

//  Created by AppleUser on 16/3/31.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str=@"312dad12sa124124dd-12";
    NSString *result=@"";
    for (int i=0; i<str.length; i++) {
        unichar tem=[str characterAtIndex:i];
        if (tem>='0'&&tem<='9')
        {
        result=[result stringByAppendingFormat:@"%c",tem];
        }
    }
    NSLog(@"取出的新字符串为%@",result);
    
    return 0;
}
