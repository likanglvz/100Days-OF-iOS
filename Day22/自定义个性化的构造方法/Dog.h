//
//  Dog.h
//  自定义个性化的构造方法
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
-(id)initWithName:(NSString*)name;
-(id)initWithName:(NSString *)name andAge:(int)age;
-(void)show;
@property NSString*name;
@property int age;
@end
