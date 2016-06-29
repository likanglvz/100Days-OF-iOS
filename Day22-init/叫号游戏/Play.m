//
//  Play.m
//  叫号游戏
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Play.h"

@implementation Play
/*显示所有参与者的状态*/
-(void)show
{
    NSLog(@"目前参与者的状态为:");
    for (int i = 0; i<[self number]; i++) {
        NSLog(@"%d",_arr[i]);
    }
}
/*查找最后剩下的参与者，返回其编号*/
-(int)search
{
    int i = 0;
    for (; i<_number; i++) {
        if (_arr[i]!=-1) {
            break;
        }
    }
    return i;
}
@end
