//
//  A.h
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B.h"
@class C;
@interface A : NSObject
@property (nonatomic,retain)B*b;
@property (nonatomic,assign)C*c;
@end
