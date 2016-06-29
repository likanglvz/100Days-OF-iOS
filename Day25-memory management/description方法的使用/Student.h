//
//  Student.h
//  description方法的使用
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic)NSString *name;
@property (nonatomic)int age;
@property (nonatomic)int Id;
-(id)initWithName:(NSString*)name andWithAge:(int)age;
@end
