//
//  main.m
//  hash练习
//
//  Created by AppleUser on 16/4/6.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    Student *s1=[Student studentWithName:@"joke" andWithSid:12];
    Student *s2=[Student studentWithName:@"jamerry" andWithSid:14];
    Student *s3=[Student studentWithName:@"john" andWithSid:17];
    Student *s4=[Student studentWithName:@"joke" andWithSid:12];
    
//    NSUInteger a1=[s1 hash];
//    NSUInteger a2=[s2 hash];
//    NSUInteger a3=[s3 hash];
//    NSUInteger a4=[s4 hash];
//    NSUInteger arr1[4]={a1,a2,a3,a4};
//    
//    NSMutableArray *arr=[NSMutableArray arrayWithObjects:s1,s2,s3, nil];
//    NSSet *set;
//    
//    
//    for (int i=0; i<3; i++) {
//        for (int j=0; j<3; j++) {
//            if ( arr1[j]==arr1[j+1]) {
//                if ([arr[i]isEqual:arr[i+1]]) {
//                    continue;
//                }
//            }set=[[NSSet alloc]initWithObjects:arr[i], nil];
//            
//        }
//    }
//    NSLog(@"%@",set);
    
    NSSet *set=[[NSSet alloc]initWithObjects:s1,s2,s3,s4,nil];
    
    for (NSObject *tem in set) {
        NSLog(@"%@",tem);
    }
    
    return 0;
}
