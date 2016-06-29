//
//  main.m
//  可变数组
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//
/*
 把1到50之间所有能被3整除的数字放到动态数组中，然后打印出数组中内容
 
 */



#import <Foundation/Foundation.h>
void test()
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 1; i<=50; i++) {
        if (i%3 == 0) {
            [arr addObject:@(i)];
        }
    }
    for (int i = 0; i<arr.count; i++) {
#if 0
        NSNumber *n = arr[i];
        NSLog(@"%d",n.intValue);
#endif
        NSLog(@"%d",[arr[i] intValue]);
//        [arr objectAtIndex:i];
    }
    
}
int main(int argc, const char * argv[]) {
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"a",@"b",nil];
    arr = [NSMutableArray arrayWithCapacity:10];
//    arr = @[@"a",@"b"];可变数组不可以用这种方式赋值
//    arr[3] = @"c";
    [arr addObject:@"老王"];
    [arr addObject:@"老李"];
    [arr removeObject:@"a"];
    [arr removeLastObject];
    for (int i = 0; i<arr.count; i++) {
        NSLog(@"%@",arr[i]);
    }
    test();
    return 0;
}

