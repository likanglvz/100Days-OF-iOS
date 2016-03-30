//
//  main.m
//  homework2


//求两个数字型的字符串按10进制数值做差后以字符串形式输出，如果@"158",@"30",这两个字符串相减后输出@"128"


//  Created by AppleUser on 16/3/31.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSString *str1 = @"158";
    NSString *str2 = @"30";
    int a = [str1 intValue]-[str2 intValue];
    [NSString stringWithFormat:@"%d",a];
    
    NSLog(@"%@", [NSString stringWithFormat:@"%d",a]);
    
    
    return 0;
}
