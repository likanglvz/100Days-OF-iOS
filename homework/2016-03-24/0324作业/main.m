//
//  main.m
//  0324作业





//作业1：
//用多态实现一个音乐家类，可以使用任意一件乐器演奏，要求如下：
//1.乐器类：有方法play是抽象方法，不实现
//2.定义两个乐器类的子类，Violin,Piano
//3.定义一个工厂类，有一个类方法用来提供各种实例对象，如violin,piano,
//4.音乐家对象可以通过工厂得到各种乐器进行演奏



//  Created by AppleUser on 16/3/25.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shopping.h"
#import "Musician.h"
#import "Piano.h"
#import "Violin.h"
#include <stdio.h>

int main(int argc, const char * argv[]) {
    //NSObject *m=[[Musician alloc]init];
   // NSLog(@"%@",[Shopping support:@"violin"]);
    NSLog(@"请演奏家选择所需要的乐器：piano或者violin");
    char choice[1]="";//选择乐器，choice1存放c字符串
    scanf("%s",choice);
    NSString *choice1 = [NSString stringWithUTF8String:choice];
    
    /*转换成oc字符串*/
   // NSLog(@"%@",choice1);
    [Shopping support:choice1];/*调用方法*/
    
    [Musician choose:choice1];
    /*判断执行哪个类方法*/
    
    if ([choice1 isEqualToString:@"piano"] ) {
        [Piano play];
       
    }
    if ([choice1 isEqualToString:@"violin"] ) {
        [Violin play];
    }
    
    
    
    
    
    

    return 0;
}
