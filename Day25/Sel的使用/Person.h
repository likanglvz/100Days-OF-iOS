//
//  Person.h
//  Sel的使用
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NameAndAge.h"
@interface Person : NSObject
@property (nonatomic)int age;
@property (nonatomic)NSString *name;
-(void)test1;
+(void)test2;
-(void)test3:(NSString*)name;
-(void)test4:(NSString*)name1 andWithName2:(NSString*)name2;
-(void)test5:(NSString*)name andWithAge:(int)age;
-(void)test6:(NameAndAge *)obj;
@end
