//
//  Person.h
//  拥有三个对象型成员变量
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mobile.h"
#import "Dog.h"
#import "Car.h"
@interface Person : NSObject
/*此处的retain会导致在set方法中
 release旧值，retain新值*/
@property (retain)Mobile *m;
/*
 -(void)setM:(Mobile*)m
 {
    if(_m!=m){
        [_m release];
        _m = [m retain];
 
    }
 }
 */
@property (retain)Dog*d;
@property (retain)Car *c;
@property (retain,getter=iosGetName,setter=iosSetName:)NSString *name;
@property (assign,atomic,readonly)int age;
@property (assign,getter=isLoser)BOOL loser;
@end
