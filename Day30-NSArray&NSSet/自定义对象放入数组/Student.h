//
//  Student.h
//  自定义对象放入数组
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,assign)int age;
@property (nonatomic,copy)NSString *name;
+(Student*)studentWithName:(NSString*)name andWithAge:(int)age;
@end
