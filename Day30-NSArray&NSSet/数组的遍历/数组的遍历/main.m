//
//  main.m
//  数组的遍历
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:@1];
    [arr addObject:@2];
    [arr addObject:@3];
    
//    [arr replaceObjectAtIndex:2 withObject:@4];
#if 0
    /*第一种*/
    for (int i = 0; i<arr.count; i++) {
        [arr replaceObjectAtIndex:i withObject:@(i)];
        NSLog(@"%@",arr[i]);
    }
    /*第二种：快速枚举,在枚举过程中不可修改数组中的元素*/
    for (NSObject* tmp in arr) {
        NSLog(@"%@",tmp);
//        [arr replaceObjectAtIndex:1 withObject:@(100)];错误
    }
    /*第三种遍历*/
        //产生枚举器
    NSEnumerator *en = [arr objectEnumerator];
    NSNumber *n;
    while (n = [en nextObject]) {
        NSLog(@"%@",n);
            //        [arr replaceObjectAtIndex:1 withObject:@(100)];错误
    }
#endif
    
    
    
    /*第四种：用代码块*/
    void (^block)(id obj,NSUInteger idx,BOOL *stop) = ^(id obj,NSUInteger idx,BOOL *stop){
        NSLog(@"index=%lu,obj=%@,abc=%d",idx,obj,*stop);
        if (idx == 1) {
            *stop = YES;
        }
    };
//    block(@"",1,NULL);
    [arr enumerateObjectsUsingBlock:block];
    /*
     enumerateObjectsUsingBlock:block
     {
        BOOL abc = NO;
        NSArray *a = self;//a==arr
        for(int i = 0;i<a.count;i++){
            block(a[i],i,&abc);
            if(abc){
                break;
            }
     
        }
     
     }
     
     */
    return 0;
}
