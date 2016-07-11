//
//  Student.h
//  0505第二个KVC
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//
@class GirlFriend;
#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(nonatomic,strong)GirlFriend * girlFriend;
@property(nonatomic,strong)NSArray * mettingList;
@property(nonatomic,strong)NSString * name1;
@end
