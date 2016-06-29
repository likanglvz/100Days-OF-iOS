//
//  Person.h
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @protected
    int _age;
    int _height;
    double _weight;
    NSString *_name;
}
//-(void)setAge:(int)age;
//-(int)age;
@property int age;
@property int height;
@property double weight;
@property NSString *name;

-(void)test;
@end
