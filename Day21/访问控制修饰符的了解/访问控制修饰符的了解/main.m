//
//  main.m
//  访问控制修饰符的了解
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Father.h"
#import "Son.h"
int main(int argc, const char * argv[]) {
    Father *f = [Father new];
    Father *a = [Father new];
    f->_x = 100;
        //下面正确
    Son *s = [Son new];
    s->girlFriend = @"小珊";
    
        //下面错误
    Father *father = [Son new];
//    father->_girlFriend = @"小珊";
    
    /*下面的转换只是暂时把father指针当son指针使用，但father仍然是father指针*/
    Son *s1 = (Son*)father;
    s = father;
    s1->girlFriend = @"xsss";
    return 0;
}


