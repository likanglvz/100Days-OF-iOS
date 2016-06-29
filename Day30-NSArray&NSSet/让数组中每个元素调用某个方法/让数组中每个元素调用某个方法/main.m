//
//  main.m
//  让数组中每个元素调用某个方法
//
//  Created by 李康 on 16/4/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
/*字符串数组的导入与导出*/
int main(int argc, const char * argv[])
{
    NSString *path = @"/Users/apple/Desktop/1 2.txt";
    NSArray *arr = @[@123,@456,@789];
//    Car *c1 = [Car carWithSpeed:40];
//    Car *c2 = [Car carWithSpeed:60];
//    Car *c3 = [Car carWithSpeed:80];
    
//    NSArray *arr = @[c1,c2,c3];
    /*把数组写文件,注意：普通对象不能写文件，只有NSString，NSNumber,NSDate等Foundation中提供好的常用类才可以写*/
    [arr writeToFile:path atomically:YES];
    /*把文件中内容读出来*/
    arr = [NSArray arrayWithContentsOfFile:path];
    for (id tmp in arr) {
        NSLog(@"%@",tmp);
    }
    
    
}
/*数组与字符串*/
int test1(int argc, const char * argv[])
{
    NSString *src = @"2016-04-05";
    /*分割字符串到一个数组中*/
    NSArray *arr = [src componentsSeparatedByString:@"-"];
    for (NSString *tmp in arr) {
        NSLog(@"%@",tmp);
    }
    /*把一个字符串型数组合并成一个字符串*/
    NSString *dest = [arr componentsJoinedByString:@"/"];
    NSLog(@"%@",dest);
    return 0;
}



int test(int argc, const char * argv[]) {
    Car *c1 = [Car carWithSpeed:40];
    Car *c2 = [Car carWithSpeed:60];
    Car *c3 = [Car carWithSpeed:80];
    
    NSArray *arr = @[c1,c2,c3];
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:arr];
    
    SEL sel = @selector(run);
//    [arr performSelector:sel];
    [arr makeObjectsPerformSelector:sel];
    
    
    /*判断对象是否有能力执行某个方法*/
    BOOL a = [c1 respondsToSelector:sel];
    /*判断对象所属类是否遵守某项协议*/
    BOOL b = [c1 conformsToProtocol:@protocol(NSCopying)];
    return 0;
}
