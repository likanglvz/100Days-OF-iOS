//
//  main.m
//  随机收养狗
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    /*数组中的元素值都为nil*/
    Dog *arr[10];
    for (int i = 0; i<10; i++) {
        arr[i] = [Dog new];
        [arr[i] setDogId:i];
    }
    /*产生随机数，用来领养狗*/
    int num;
    srand((unsigned)time(NULL));
    for (int i = 0; i<3; i++) {
        do{
            num = rand()%10;
            
        }while (arr[num]==nil);
        arr[num] = nil;
        NSLog(@"收养了%d号狗",num);
    }
    return 0;
}
