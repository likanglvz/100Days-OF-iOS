//
//  BossDelegate.h
//  DelegateDemo
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BossDelegate <NSObject>

@required
-(void) answerThePhone;
-(void) write;

@optional

-(void) makeBed;




@end
