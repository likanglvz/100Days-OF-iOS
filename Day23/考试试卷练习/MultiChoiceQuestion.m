//
//  MultiChoiceQuestion.m
//  考试试卷练习
//
//  Created by 李康 on 16/3/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "MultiChoiceQuestion.h"

@implementation MultiChoiceQuestion
-(void)setArrWithIndex:(int)i andString:(NSString*)str
{
    _arr[i] = str;
}
-(void)showOption
{
    for (int i = 0; i<3; i++) {
        NSLog(@"%@",_arr[i]);
    }
}
@end
