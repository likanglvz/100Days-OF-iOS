//
//  Line.m
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Line.h"

@implementation Line
-(void)draw{
    NSLog(@"画了一条线");
}
-(id)initWithName:(NSString *)name{
    self.name=name;
    return self;
}
-(NSString *)description{
    NSString *s=[NSString stringWithFormat:@"Line"];
    return s;
}
@end
