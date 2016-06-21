//
//  main.m
//  多对象的内存管理
//
//  Created by 李康 on 16/3/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Dog *d1 = [Dog new];
    d1.no = 1;
    Dog *d2 = [Dog new];
    Person*p1 = [Person new];
    p1.dog = d1;
    p1.dog = d2;
    [d1 release];
    d1 = nil;
    
    [p1 release];
    p1 = nil;
    return 0;
}



/*
 if (_dog!=dog) {
    [_dog release];
    _dog = [dog retain];
}
 */