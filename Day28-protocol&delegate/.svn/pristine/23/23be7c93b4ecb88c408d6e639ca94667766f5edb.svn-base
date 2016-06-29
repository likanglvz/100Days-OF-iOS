//
//  main.m
//  异常的处理
//
//  Created by 李连宇 on 16/3/31.
//  Copyright © 2016年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
int main(int argc, const char * argv[]) {
    Car *car = [Car new];
//    if ([car respondsToSelector:@selector(speed)]) {
//        [car speed];
//    }
    
    @try {
        /*如果在本代码块中出现异常现在,则系统会产生一个NSException类的子类对象,并抛出来,并马上结束try代码块的执行*/
        
        [car speed];
        NSLog(@"xxxxxxxxxx");
//        return 0;不会影响finally代码块的执行
//        exit(0);//这行代码直接关掉程序,会导致finally不被执行
    }
    
    @catch(NSException *e)
    {
        NSLog(@"在第二楼抓到你了");
//        NSLog(@"出错原因为:%@,name=%@,userinfo=%@",e.reason,e.name,e.userInfo);
    }
    /*本代码块可以不写,如果有的话,则本代码块死活都会执行*/
    @finally{
        NSLog(@"不管有没有异常,也不管异常是否被捕捉到,程序都会执行本代码块");
    }
    
    NSLog(@"......");
    
    return 0;
}
