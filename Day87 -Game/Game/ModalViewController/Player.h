//
//  Player.h
//  炸金花！
//
//  Created by 李康 on 16/5/23.
//  Copyright © 2016年 李康. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "pokerViewController.h"



@interface Player : NSObject

    
@property(strong,nonatomic)   NSString *value;//牌值  1 xx xx xx的格式 用于比较

@property(assign,nonatomic)int money;//筹码数

@property(strong,nonatomic)UIImageView *m1;
@property(strong,nonatomic)UIImageView *m2;
@property(strong,nonatomic)UIImageView *m3;
@property(strong,nonatomic)UIImageView *red;
@property(strong,nonatomic)UILabel *label;

    
@property(assign,nonatomic) BOOL success;

@property(assign,nonatomic) int did;
    
    
    

    

@end
