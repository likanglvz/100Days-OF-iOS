//
//  Sub.m
//  homework
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Sub.h"

@implementation Sub
-(int)result:(int)num1 andWithNum2:(int)num2{
    NSLog(@"%d",num1-num2);
    return 0;
}
-(id)initWithNum1:(int)num1 andWithNum2:(int)num2{
    
        _num1=num1;
        _num2=num2;
    
    return self;
}
@end
