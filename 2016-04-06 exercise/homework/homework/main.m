//
//  main.m
//  homework
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Factory.h"
#import "Add.h"
#import "Sub.h"
int main(int argc, const char * argv[]) {
    id s1=[Factory calculate:3 andWith:5 with:@"Add"];
    id s2=[Factory calculate:6 andWith:4 with:@"Sub"];
    return 0;
}
