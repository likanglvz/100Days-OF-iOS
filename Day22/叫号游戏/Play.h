//
//  Play.h
//  叫号游戏
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 int a = *(arr+2);
 arr++;arr = arr+1;
 */
@interface Play : NSObject
@property int *arr;
@property int number;
/*显示所有参与者的状态*/
-(void)show;
/*查找最后剩下的参与者，返回其编号*/
-(int)search;
@end
