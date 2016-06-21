//
//  main.m
//  自动释放对象的产生
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Animal *a = [Animal animal];
        
       Animal *a = [Animal animalWithAge:2];
        
    }
    return 0;
}
