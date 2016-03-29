//
//  B.h
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "C.h"
@class A;
@interface B : NSObject
@property (nonatomic,retain)C*c;
@property (nonatomic,assign)A*a;
@end
