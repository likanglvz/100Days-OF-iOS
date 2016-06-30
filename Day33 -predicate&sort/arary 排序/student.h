//
//  student.h
//  arary 排序
//
//  Created by AppleUser on 16/4/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface student : NSObject
@property (nonatomic,strong)NSString *name;
@property (assign,nonatomic)int age;
-(NSComparisonResult)compareName:(id)obj;
@end
