//
//  Circle.m
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Circle.h"

@implementation Circle
-(void)draw{
    NSLog(@"画了一个圆");
}
-(id)initWithName:(NSString *)name{
    self.name=name;
    return self;
}
-(NSString *)description{
    NSString *s=[NSString stringWithFormat:@"Circle"];
    return s;
}
@end
