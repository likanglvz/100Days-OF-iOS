//
//  Person.h
//  ARC的工作原理
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
@property (nonatomic,strong)Dog *dog1;
/*这里的weak相当于assign,当对象被释放时，该_dog会被赋值为nil,只用于arc环境*/
@property (nonatomic,weak)Dog *dog2;
@end
