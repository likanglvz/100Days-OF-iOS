//
//  main.m
//  类的继承
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
# define Window 1
# define  Mac 0
int main(int argc, const char * argv[]) {
//    Animal *a0 = [Animal new];new作了什么事情？

    Animal *a = [Animal alloc];
    a = [a init];


//    [a eat];错误，父类不可以调用子类特有方法
    [a say];
    
    Dog *d = [[Dog alloc]init];
    [d setAge:10];
    
    
    [d eat];
    
    [d say];

//    Animal *animal = [Dog new];
//    
//    [animal say];
//    [animal eat];
    return 0;
}
