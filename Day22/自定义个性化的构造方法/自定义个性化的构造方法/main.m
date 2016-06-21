//
//  main.m
//  自定义个性化的构造方法
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Dog *d1 = [[Dog alloc]init];
    Dog *d2 = [[Dog alloc]initWithName:@"abc"];
    Dog *d3 = [[Dog alloc]initWithName:@"哈哈" andAge:2];
    [d3 show];
    return 0;
}
