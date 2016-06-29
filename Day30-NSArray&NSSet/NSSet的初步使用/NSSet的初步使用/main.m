//
//  main.m
//  NSSet的初步使用
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSArray *arr = @[@1,@2];
    
    NSSet *set = [[NSSet alloc]initWithObjects:@3,@"two",arr, nil];
    NSLog(@"元素个数为%ld",set.count);
    
    NSLog(@"是否包含元素\"two\"?%d",[set containsObject:@"two"]);
    /*
     hash算法
     */
    NSSet *set2 = [[NSSet alloc]initWithObjects:@"two",arr, nil];
    NSLog(@"set1==set2?%d,内容相等吗？%d",set==set2,[set isEqualToSet:set2]);
    
    NSLog(@"set2是set1的子集吗？%d",[set2 isSubsetOfSet:set]);
    /*set中元素是无顺序的，arr有顺序*/
    NSArray *src = [set allObjects];
    for(id tmp in src){
       NSLog(@"%@",tmp);
    }
    NSLog(@"随机取出一个元素%@",[set anyObject]);
    
    NSEnumerator *e = [set objectEnumerator];
    id tmp;
    while (tmp = [e nextObject]) {
        NSLog(@"%@",tmp);
    }
    
    
    return 0;
}
