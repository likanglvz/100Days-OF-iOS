//
//  Animal.m
//  自动释放对象的产生
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Animal.h"

@implementation Animal
/*copy*/
+(id)animal
{
    Animal *a = [[[self alloc]init]autorelease];
    return a;
}
+(id)animalWithAge:(int)age
{
    Animal *a = [self animal];
    a.age = age;
    return a;
}
-(void)dealloc
{
    NSLog(@"animal释放了");
    [super dealloc];
}
@end
