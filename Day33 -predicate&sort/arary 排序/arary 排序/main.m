//
//  main.m
//  arary 排序
//
//  Created by AppleUser on 16/4/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "student.h"

int main(int argc, const char * argv[]) {
    NSMutableArray *arr1=[NSMutableArray arrayWithArray:@[@"3",@"1",@"5",@"4"]];
    
    [arr1 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
    
        if ([obj1 intValue]>[obj2 intValue]) {
            return NSOrderedDescending;
        }if ([obj1 intValue]<[obj2 intValue]) {
            return  NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
    NSLog(@"%@",arr1);
    
    
    student *s1=[student new];
    student *s2=[student new];
    student *s3=[student new];
    
    s1.age=12;
    s2.age=7;
    s3.age=23;
    
    s1.name=@"u";
    s2.name=@"g";
    s3.name=@"a";
    
    NSArray *arr2=@[s1,s2,s3];
    NSArray *arr2new=[arr2 sortedArrayUsingSelector:@selector(compareName:)];
    
    NSLog(@"arr2new=%@",[arr2new[0] description]);
     NSLog(@"arr2new=%@",[arr2new[1] description]);
     NSLog(@"arr2new=%@",[arr2new[2] description]);
    
    NSSortDescriptor *s=[[NSSortDescriptor alloc]initWithKey:@"age" ascending:NO];
    NSArray *arr2new2=[arr2 sortedArrayUsingDescriptors:@[s]];
    NSLog(@"arr2new2=%@",[arr2new2[0] description]);
    NSLog(@"arr2new2=%@",[arr2new2[1] description]);
    NSLog(@"arr2new2=%@",[arr2new2[2] description]);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
