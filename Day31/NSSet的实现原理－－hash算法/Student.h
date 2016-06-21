//
//  Student.h
//  NSSet的实现原理－－hash算法
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,assign)int sid;
@property (nonatomic,copy)NSString *name;
+(Student*)studentWithName:(NSString*)name andWithId:(int)sid;
@end
