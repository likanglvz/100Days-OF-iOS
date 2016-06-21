//
//  main.m
//  NSSet的实现原理－－hash算法
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
//    NSSet *set = [[NSSet alloc]initWithObjects:@1,@2,@2,@3, nil];
//    NSLog(@"%@",set);
    
    Student *s1 = [Student studentWithName:@"AA" andWithId:3];
    Student *s2 = [Student studentWithName:@"AA" andWithId:3];
    Student *s3 = [Student studentWithName:@"AA" andWithId:4];
    Student *s4 = [Student studentWithName:@"aA" andWithId:3];
    NSSet *set = [[NSSet alloc]initWithObjects:s1,s2,s3,s4, nil];
//    for (id tmp in set) {
//        NSLog(@"%@",tmp);
//    }
    NSEnumerator *e = [set objectEnumerator];
    id tmp;
    while (tmp = [e nextObject]) {
        NSLog(@"%@",tmp);
    }
    return 0;
}
