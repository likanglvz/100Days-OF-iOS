//
//  C.h
//  day09ABC三种对象相互包含
//
//  Created by AppleUser on 16/3/29.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
@class A;
@class B;
@interface C : NSObject
@property (nonatomic,assign)A*a;
@property (nonatomic,assign)B*b;
@end
