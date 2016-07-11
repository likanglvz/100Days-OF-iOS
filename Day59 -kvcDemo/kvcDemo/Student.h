//
//  Student.h
//  kvcDemo
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

@class GirlFriend;

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic,strong) NSString * name1;

@property(nonatomic,strong)GirlFriend * girlFriend;
@property(nonatomic,strong) NSArray * meetingList;


@end
