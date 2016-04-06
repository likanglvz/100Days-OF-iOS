//
//  Number.m
//  homework
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Number.h"

@implementation Number
-(id)initWithNum1:(int)num1 andWithNum2:(int)num2{
    if (self=[super init]) {
        _num1=num1;
        _num2=num2;
    }
    return self;
}
-(int)result{
    return 0;
}
@end
