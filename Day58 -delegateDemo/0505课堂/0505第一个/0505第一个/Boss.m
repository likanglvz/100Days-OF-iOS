//
//  Boss.m
//  0505第一个
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "Boss.h"

@implementation Boss


-(void)schedule
{
       count = 0;
       //定时器，每隔三秒钟触发一次selector
       timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(handleStuff) userInfo:nil repeats:YES];
       
}
-(void)handleStuff
{
       switch (count) {
              case 0:
                     //调用代理方法
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
