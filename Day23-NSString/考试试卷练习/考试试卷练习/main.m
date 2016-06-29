//
//  main.m
//  考试试卷练习
//
//  Created by 李康 on 16/3/24.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleQuestion.h"
#import "MultiChoiceQuestion.h"
int main(int argc, const char * argv[]) {
    int num = 2;
    Question *paper[num];
    paper[0] = [SingleQuestion new];
    paper[0].text = @"屌哥有几个妹妹?";
    [paper[0] setArrWithIndex:0 andString:@"A. 一个"];
    [paper[0] setArrWithIndex:1 andString:@"B. 很多个"];
    paper[0].answer = @"A";
    
    paper[1] = [MultiChoiceQuestion new];
    paper[1].text = @"让子弹飞的主演是谁?";
    [paper[1] setArrWithIndex:0 andString:@"A. 姜子牙"];
    [paper[1] setArrWithIndex:1 andString:@"B. 姜文"];
    [paper[1] setArrWithIndex:2 andString:@"C. 姜武"];
    paper[1].answer = @"BC";
    
    char tmp[10] = "";
    int score = 0;
    for (int i = 0; i<2; i++) {
        [paper[i] showQuestion];
        [paper[i] showOption];
        scanf("%s",tmp);
        /*把c字符串转为oc字符串*/
        NSString *answer = [NSString stringWithUTF8String:tmp];
        if ([paper[i] check:answer]) {
            NSLog(@"回答正确，加一分.");
            score++;
        }else{
            NSLog(@"回答错误，继续努力");
        }
    }
    NSLog(@"你一共答对了%d道题",score);
    return 0;
}
