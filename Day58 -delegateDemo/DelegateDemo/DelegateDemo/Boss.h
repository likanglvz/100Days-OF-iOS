//
//  Boss.h
//  DelegateDemo
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BossDelegate.h"

@interface Boss : NSObject
{
    NSTimer * timer;
    int count;
    
}
//代理属性
@property(nonatomic,weak) id<BossDelegate> delegate;

-(void) schedule;
-(void) handleStuff;



@end
