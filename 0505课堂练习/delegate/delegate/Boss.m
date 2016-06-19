//
//  Boss.m
//  delegate
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Boss.h"

@implementation Boss

-(void)schedule{
    count = 0;
    //设置定时器，每隔三秒钟触发一次selector
    timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(handleStuff) userInfo:nil repeats:YES];
    
    
}
-(void)handleStuff{
    switch (count) {
        case 0:
            [self.delegate answerThePhone];
            count++;
            break;
        case 1:
            [self.delegate write];
            count++;
            break;
        case 2:
            [self.delegate makeBed];
            //关闭定时器
            [timer invalidate];
            break;
            
        default:
            break;
    }
    
}


@end
