//
//  Square.m
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Square.h"

@implementation Square
-(void)draw{
    NSLog(@"画了一个正方形");
}
-(id)initWithName:(NSString *)name{
    self.name=name;
    return self;
}
-(NSString *)description{
    NSString *s=[NSString stringWithFormat:@"Square"];
    return s;
}
@end
