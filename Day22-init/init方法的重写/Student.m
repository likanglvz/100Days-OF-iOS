//
//  Student.m
//  init方法的重写
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)init
{
    if (self=[super init]) {
        _score = 50;
    }
//    self = [super init];
//    _score = 50;
    return self;
}
@end
