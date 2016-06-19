//
//  Boss.h
//  delegate
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BossDelegate.h"

@interface Boss : NSObject

{
    NSTimer *timer;
    int count;
}
//代理属性用weak ，避免循环引用。
@property(nonatomic,weak) id<BossDelegate>delegate;
-(void)schedule;
-(void)handleStuff;

@end
