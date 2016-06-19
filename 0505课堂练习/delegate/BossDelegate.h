//
//  BossDelegate.h
//  delegate
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BossDelegate <NSObject>

@required
-(void)answerThePhone;
-(void)write;


@optional
-(void)makeBed;

@end
