//
//  Boss.h
//  0505第一个
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BossDelegate.h"


@interface Boss : NSObject
{
       NSTimer * timer;
       int count;
}
@property(nonatomic,weak) id<BossDelegate>delegate;

-(void) schedule;
-(void) handleStuff;
@end
