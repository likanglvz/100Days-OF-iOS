//
//  Dog.h
//  普通对象的copy
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject<NSCopying>
@property (nonatomic,copy)NSString *name;
@end
