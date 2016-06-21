//
//  main.m
//  通过类方法产生对象
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Animal *a1 = [[Animal alloc]init];
    Animal *a2 = [Animal animal];
    Animal *a3 = [Animal animalWithName:@"哈哈"];
    
    Dog *d = [Dog animal];
    Dog *d1 = [Dog animalWithName:@"狗狗"];
        return 0;
}
