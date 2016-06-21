//
//  Car.h
//  让数组中每个元素调用某个方法
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (nonatomic,assign)int speed;
-(void)run;
+(Car *)carWithSpeed:(int)speed;
@end
