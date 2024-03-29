//
//  Cat.h
//  普通对象的copy
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@interface Cat : NSObject<NSCopying>
/*
 retain:release旧值，retain新值
 copy:release旧值，copy新值
 -(void)setName:(NSString*)name
 {
    if(_name!=name){
        [_name release]
        _name = [name copy];
    }
 }
 
 */
/*字符串类型属性一般用copy修饰*/
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int age;
@property (nonatomic,strong)Dog *dog;
@end
