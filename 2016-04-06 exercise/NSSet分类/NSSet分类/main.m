//
//  main.m
//  NSSet分类
//
//  Created by AppleUser on 16/4/6.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSSet+Show.h"

int main(int argc, const char * argv[]) {
    NSMutableSet *set=[[NSMutableSet alloc]initWithObjects:@1,@2,@3, nil];
    [set show];
    
    
    return 0;
}
