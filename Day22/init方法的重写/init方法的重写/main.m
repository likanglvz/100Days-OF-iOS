//
//  main.m
//  init方法的重写
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
   Person *p = [[Person alloc]init];
   
    NSLog(@"p.age=%d",p.age);
    
   Student *s = [[Student alloc]init];
    return 0;
}
