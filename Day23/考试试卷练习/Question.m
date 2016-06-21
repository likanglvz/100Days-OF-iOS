//
//  Question.m
//  考试试卷练习
//
//  Created by 李康 on 16/3/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Question.h"

@implementation Question
-(BOOL)check:(NSString*)answer
{
    /*比较两个字符串内容是否相等，不可以用==，因为这是比较两个对象地址是否相同*/
    return [answer isEqualToString:_answer];
}
/*下面是空方法，什么功能都不实现*/
-(void)setArrWithIndex:(int)i andString:(NSString*)str
{
    return;
}
/*显示题目*/
-(void)showQuestion
{
    NSLog(@"%@",self->_text);
}
/*显示选项, 抽象方法，什么也不作*/
-(void)showOption
{
    return;
}
@end
