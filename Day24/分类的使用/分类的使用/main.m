//
//  main.m
//  分类的使用
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People+Student.h"
#import "People+Teacher.h"
#import "Son.h"
int main(int argc, const char * argv[]) {
    People *p = [People new];
    
    [p test];
    [p showTeacher];
    Son *s = [Son new];
    [s show];
    
    p.height = 20;
    [p show];
    [p privateMethed];
    return 0;
}
