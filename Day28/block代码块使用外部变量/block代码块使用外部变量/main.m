//
//  main.m
//  block代码块使用外部变量
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int n = 3;
    /*用__block修饰的变量可在block中修改*/
    __block int n1 = 4;
    typedef int AGE;
    typedef int (^multi)(int);
    
    multi m = ^(int a){
        /*block块中如果使用外部定义的变量,则该变量在block中是只读的*/
//        n = 4;错误
        n1 = 5;
       return n1*a;
    };
    NSLog(@"乘积为%d,n1 = %d",m(5),n1);
    return 0;
}
