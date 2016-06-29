//
//  Car.h
//  循环引用引发的问题
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Car : NSObject
@property (nonatomic,retain)Person *master;
-(void)test;
@end
