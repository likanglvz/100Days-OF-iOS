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
}

-(NSString *)getModel
{//以字符串返回结果
    return [NSString stringWithFormat:@"%f",accumulator];
    
}


@end
