//
//  BossDelegate.h
//  0505第一个
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BossDelegate <NSObject>
@required
-(void)answerThePhone;
-(void)write;
@optional
-(void)makeBed;
@end
