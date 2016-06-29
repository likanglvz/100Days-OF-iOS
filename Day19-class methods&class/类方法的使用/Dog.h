//
//  Dog.h
//  类方法的使用
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    int _age;
}
-(void)show;
-(void)setAge:(int)age;
-(int)age;
/*
 类方法
 */
+(void)show;
@end
