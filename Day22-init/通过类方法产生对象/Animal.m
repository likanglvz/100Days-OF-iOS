//
//  Animal.m
//  通过类方法产生对象
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Animal.h"

@implementation Animal
+(id)animal
{
    Animal *a = [[self alloc]init];
    return a;
    
}
+(id)animalWithName:(NSString*)name
{
    Animal *a = [self animal];
    a.name = name;
    return a;
}
@end
