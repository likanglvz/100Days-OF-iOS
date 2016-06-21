//
//  SingleQuestion.h
//  考试试卷练习
//
//  Created by 李康 on 16/3/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Question.h"

@interface SingleQuestion : Question
{
    /*普通数组不能作为属性*/
    NSString *_arr[2];
}

@end
