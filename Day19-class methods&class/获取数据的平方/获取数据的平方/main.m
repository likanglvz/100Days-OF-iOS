//
//  main.m
//  获取数据的平方
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Computer:NSObject
-(double)pi;
/*计算一个数字的平方*/
-(int)square:(int)num;
/*计算两个数字的和*/
-(int)addWithNum1:(int)num1 andWithNum2:(int)num2;
@end

@implementation Computer

-(double)pi
{
    return 3.14;
    
}
/*计算一个数字的平方*/
-(int)square:(int)num
{
    return num*num;
}
/*计算两个数字的和*/
-(int)addWithNum1:(int)num1 andWithNum2:(int)num2
{
    return num1+num2;
}

@end

int main(int argc, const char * argv[]) {
    Computer *computer = [Computer new];
    double pi = [computer pi];
    int result = [computer addWithNum1:3 andWithNum2:5];
    int square = [computer square:3];
    
    NSLog(@"pi=%f,result=%d,square=%d",pi,result,square);
    
    return 0;
}
