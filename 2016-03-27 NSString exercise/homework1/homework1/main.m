//
//  main.m
//  homework1
//
//  Created by 李康 on 16/3/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Statistics.h"

int main(int argc, const char * argv[]) {
    NSString *s=@"中国是我的hometown,my height is 180";
    NSLog(@"%@中数字的个数是：%d",s,[NSString numInString:s]);
    NSLog(@"%@中字母的个数是：%d",s,[NSString letterInString:s]);
    NSLog(@"%@中符号的个数是：%d",s,[NSString symbolInString:s]);
    NSLog(@"%@中汉字的个数是：%d",s,[NSString chineseInString:s]);
    
    
    
    
    return 0;
}
