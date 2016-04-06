//
//  Factory.m
//  homework
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Factory.h"
#import "Add.h"
#import "Sub.h"
#import "Number.h"
@implementation Factory
+(id)calculate:(int)num1 andWith:(int)num2 with:(NSString *)way{
    Class c=NSClassFromString(way);
    id obj=[[c alloc]initWithNum1:num1 andWithNum2:num2];
   [obj result:num1 andWithNum2:num2];
    return obj;
    
}
@end
