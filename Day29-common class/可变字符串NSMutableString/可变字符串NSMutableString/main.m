//
//  main.m
//  可变字符串NSMutableString
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSMutableString *m = [[NSMutableString alloc]initWithCapacity:0];
    [m setString:@"www.itany.com"];
    NSString *s1 = @"welcom to NanJing";
    [m appendString:s1];
    /*向某个位置插入一个字符串*/
    [m insertString:@"xxx" atIndex:m.length];
    /*删除下标为3，长度为4的小字符串*/
    NSRange r = NSMakeRange(3, 4);
    [m deleteCharactersInRange:r];
    
    r = [m rangeOfString:@"to"];
    /*把某个范围的字符串替换成新字符串*/
    [m replaceCharactersInRange:NSMakeRange(0, 3) withString:@"abc"];
    
    NSLog(@"%@",m);
    
    
    return 0;
}
