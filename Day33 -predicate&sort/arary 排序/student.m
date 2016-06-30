//
//  student.m
//  arary 排序
//
//  Created by AppleUser on 16/4/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "student.h"

@implementation student
-(NSComparisonResult)compareName:(id)obj{
    
    return -[self.name compare:[obj name]];
}
-(NSString *)description{
    
    return [NSString stringWithFormat:@"name=%@,age=%d",self.name,self.age];
}
@end
