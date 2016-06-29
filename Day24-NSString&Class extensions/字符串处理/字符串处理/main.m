//
//  main.m
//  字符串处理
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /*查询某个小字符串在一个大字符串中是否存在*/
    NSString *s0 = @"中文my name is itany";
    NSString *tmp = @"is";
    NSRange r = [s0 rangeOfString:tmp];
    
    NSLog(@"%@",NSStringFromRange(r));
    NSLog(@"%d",r.location);
    if(r.location==NSNotFound){
        NSLog(@"没有找到匹配的字符串");
    }
    
    /*字符串替换*/
//    NSLog(@"%@",[s0 stringByReplacingOccurrencesOfString:@" " withString:@"@"]);
//    NSLog(@"%@",[s0 stringByReplacingCharactersInRange:r withString:@"IOS"]);
//    
//    /*去掉字符串前后的空格，中间的空格保留*/
//    NSString *s1 = @" a bc ";
//    NSLog(@"%@",[s1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
//    NSLog(@"%@",s1);
    return 0;
}
