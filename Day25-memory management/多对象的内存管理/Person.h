//
//  Person.h
//  多对象的内存管理
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
{
    Dog *_dog;
}
-(void)setDog:(Dog*)dog;
-(Dog *)dog;
@end
