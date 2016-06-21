//
//  main.m
//  类工厂的使用
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Factory.h"
int main(int argc, const char * argv[]) {
    id obj = [Factory getShape:@"Line"];
    NSLog(@"name=%@",[obj name]);
    
    return 0;
}
