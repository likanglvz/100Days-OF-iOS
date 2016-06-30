//
//  main.m
//  predicateDemo
//
//  Created by AppleUser on 16/4/9.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    Person *p1=[[Person alloc]initWithFirstName:@"李" lastName:@"康" andAge:23];
    Person *p2=[[Person alloc]initWithFirstName:@"张" lastName:@"博程" andAge:25];
    Person *p3=[[Person alloc]initWithFirstName:@"何" lastName:@"亚男" andAge:24];
    Person *p4=[[Person alloc]initWithFirstName:@"陈" lastName:@"兆江" andAge:26];
    Person *p5=[[Person alloc]initWithFirstName:@"Liu" lastName:@"dasheng" andAge:50];
    Person *p6=[[Person alloc]initWithFirstName:@"唐" lastName:@"僧" andAge:76];
    Person *p7=[[Person alloc]initWithFirstName:@"猪" lastName:@"八戒" andAge:80];
    Person *p8=[[Person alloc]initWithFirstName:@"沙" lastName:@"僧" andAge:62];
    Person *p9=[[Person alloc]initWithFirstName:@"孙" lastName:@"悟空" andAge:108];
    Person *p10=[[Person alloc]initWithFirstName:@"Lee" lastName:@"gorage" andAge:16];
    
    NSArray *arr=@[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10];
    
    NSPredicate *pre;
    
    NSArray *arrSubset;
    
    pre=[NSPredicate predicateWithFormat:@"firstName='Liu'"];
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    
    NSLog(@"firstname = 'Liu'的子集:");
    
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    
    NSLog(@"");
    
    pre=[NSPredicate predicateWithFormat:@"lastName='僧'"];
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    NSLog(@"lastname = '僧'的子集:");
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    NSLog(@"");
    pre=[NSPredicate predicateWithFormat:@"age>30"];
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    NSLog(@"年龄大于30的子集:");
    [arrSubset makeObjectsPerformSelector:@selector(description)];
     NSLog(@"");
    
    pre=[NSPredicate predicateWithFormat:@"age BETWEEN {30,60}"];
    NSLog(@"年龄在30到60之间的");
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    NSLog(@"");
    
    pre=[NSPredicate predicateWithFormat:@"lastName CONTAINS'僧'"];
    NSLog(@"名字里有僧的");
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    NSLog(@"");

    NSPredicate *blockPredicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return  [[evaluatedObject firstName]length]>=2;
    }];
    arrSubset=[arr filteredArrayUsingPredicate:blockPredicate];
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    NSLog(@"");
    
    BOOL b = [blockPredicate evaluateWithObject:arr[3]];
    NSLog(@"%d",b);
    NSLog(@"");
    
    pre=[NSPredicate predicateWithFormat:@"(age>30) AND (firstName = %@)",@"孙"];
    NSLog(@"姓孙的");
    arrSubset=[arr filteredArrayUsingPredicate:pre];
    [arrSubset makeObjectsPerformSelector:@selector(description)];
    NSLog(@"");
    
    
    
    
    
    
    
    
    
    

    
    
    return 0;
}
