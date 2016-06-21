//
//  Question.h
//  考试试卷练习
//
//  Created by 李康 on 16/3/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
/*题目*/
@property  NSString *text;
/*提供标准答案*/
@property NSString *answer;
-(BOOL)check:(NSString*)answer;
-(void)setArrWithIndex:(int)i andString:(NSString*)str;
/*显示题目*/
-(void)showQuestion;
/*显示选项*/
-(void)showOption;
@end
