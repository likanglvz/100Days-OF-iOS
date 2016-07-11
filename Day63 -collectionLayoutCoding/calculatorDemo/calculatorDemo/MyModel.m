//
//  MyModel.m
//  calculatorDemo
//
//  Created by baiheng on 16/5/6.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

//完成计算器功能
-(void) setModel:(char)c
{
    switch (c) {
        case 'C':
            opr = 0.0;
            accumulator = 0.0;
            
            break;
        case '+':;case '-':;case '*':;case '/':
            op = c;
            opr = accumulator;
            accumulator = 0.0;
           break;
        case '=':
        
            switch (op) {
                case '+':
                    accumulator = opr + accumulator;
                    
                    break;
                case '-':
                    accumulator = opr - accumulator;
                    
                    break;
                case '*':
                    accumulator = opr * accumulator;
                    
                    break;
                case '/':
                    accumulator = opr / accumulator;
                    
                    break;
                    
                default:
                    break;
            }
            
 
            
            break;

        default://0...9数字 ‘0’，‘1’，。。。。
            
            accumulator = accumulator*10.0+(c-'0');
            
            break;
    }
    
    
    //计算结果放入通知
    
    NSDictionary * info = [NSDictionary dictionaryWithObject:@(accumulator) forKey:@"result"];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MyResult" object:self userInfo:info];
    
    
    
    
    
}

-(NSString *)getModel
{//以字符串返回结果
    return [NSString stringWithFormat:@"%f",accumulator];
    
}

-(BOOL)isTure{
    return YES;
}

-(BOOL)isFalse{
    
    return NO;
}

-(NSString *)helloWorld{
    
    return @"Hello World!";
}










@end
