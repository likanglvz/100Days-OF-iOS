//
//  Student.h
//  hash练习
//
//  Created by AppleUser on 16/4/6.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,assign)int sid;

@property (nonatomic)NSString *name;
-(NSUInteger)hash;
-(BOOL)isEqual:(id)object;
+(id)studentWithName:(NSString *)name andWithSid:(int )sid;
@end
