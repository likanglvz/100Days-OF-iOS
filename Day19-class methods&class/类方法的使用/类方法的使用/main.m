//
//  main.m
//  类方法的使用
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
//    [Dog show];
    

    Dog *dog = [Dog new];
    [dog setAge:3];
    
    
    Dog *dog1 = [Dog new];
    [dog1 setAge:30];
    [dog1 show];
    [dog show];
    
    [dog age];
    return 0;
}
