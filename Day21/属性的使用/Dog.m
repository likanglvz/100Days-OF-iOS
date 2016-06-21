//
//  Dog.m
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Dog.h"

@implementation Dog
/*如果下面没有等号，则生成的成员变量也为private,但名字跟属性名相同*/
@synthesize age;
-(void)test
{
    NSLog(@"age=%d",self->age);
}
@end
