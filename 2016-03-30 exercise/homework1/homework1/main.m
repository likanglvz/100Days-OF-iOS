//
//  main.m
//  homework1


//用NSString的分类实现查看某一小字符串在当前字符串中出现的次数；


//  Created by AppleUser on 16/3/31.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int count =0;
    NSString *n1 = @"iihqwfhqhqsihqiwhqwr";
    NSString *n2 = @"hq";
    NSRange r = [n1 rangeOfString:n2];
    while (r.location!=NSNotFound) {
        count ++;
        n1=[n1 substringFromIndex:(r.location+r.length)];
        r=[n1 rangeOfString:n2];
    }
    NSLog(@"字符串出现了%d次",count);
    
    
    
    return 0;
}
