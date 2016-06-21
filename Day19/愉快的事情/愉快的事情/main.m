//
//  main.m
//  愉快的事情
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//
/*
 rand();是伪随机函数，要设置它的随机种子， srand();
 */
#import <Foundation/Foundation.h>
#import "BeautifulGirl.h"
int main(int argc, const char * argv[]) {
    /*
     c中空指针用NULL 表示
     oc中空对象用nil表示
     */
//    BeautifulGirl *girl;
//    int arr0[10];
    BeautifulGirl *arr[100];
    for (int i = 0; i<100; i++) {
        arr[i] = [BeautifulGirl new];
        NSString *f = [NSString stringWithFormat:@"我喜欢男%d号",i];
        
        [arr[i] setFavorite:f];
//        NSLog(@"%@",[girl favorite]);
    }
    
    NSLog(@"%@",[arr[89] favorite]);
    return 0;
}
