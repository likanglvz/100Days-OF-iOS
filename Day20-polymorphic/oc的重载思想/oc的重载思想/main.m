//
//  main.m
//  oc的重载思想
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    Student *s = [Student new];
   [s setAge:3 andWithName:@"abc"];
    [s setAge];
    [s setAge:2];
    
    
    return 0;
}
