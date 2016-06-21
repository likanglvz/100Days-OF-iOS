//
//  main.m
//  计算器的实现
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Calc : NSObject
{
    double _accumlator;
}
-(void)showResult;
/*用于清除accumlator的值为零*/
-(void)clear;
/*下面是算术运算*/
-(void)add:(int)value;
-(void)sub:(int)value;
-(void)multi:(int)value;
-(void)div:(int)value;
@end

@implementation Calc

-(void)showResult
{
    NSLog(@"结果为:%f",_accumlator);
}
/*用于清除accumlator的值为零*/
-(void)clear
{
    _accumlator = 0;
}
/*下面是算术运算*/
-(void)add:(int)value
{
    _accumlator+=value;
}
-(void)sub:(int)value
{
    _accumlator  = _accumlator-value;
}
-(void)multi:(int)value
{
    _accumlator = _accumlator * value;
}
-(void)div:(int)value
{
    if (value) {
        _accumlator = _accumlator/value;
    }
    return;
}


@end

int main(int argc, const char * argv[]) {
    Calc *cal = [Calc new];
    
    
    [cal add:5];
    [cal div:2];
    [cal showResult];
    return 0;
}
