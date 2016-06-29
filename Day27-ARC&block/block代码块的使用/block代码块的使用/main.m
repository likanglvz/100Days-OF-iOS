//
//  main.m
//  block代码块的使用
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
int a = 10;
void (^ myBlock)() = ^(){
    NSLog(@"我是block代码块，跟函数指针长的很像");
};
int main(int argc, const char * argv[]) {
//    myBlock();
    int a =10;
    a = 10;
    
    
    /*定义一个block变量*/
    int (^addBlock)(int a,int b);
    addBlock = ^(int a,int b){
        NSLog(@"xxxx");
       return a+b;
    };
    NSLog(@"%d",addBlock(3,2));
    /*定义一个block别名*/
    typedef int (^add)(int a,int b);
    
    add maxNum = ^(int a,int b){
        return a>b ? a:b;
    };
    add subTwoNum = ^(int a,int b){
        return a-b;
    };
    subTwoNum(5,6);
    NSLog(@"最大值为%d",maxNum(3,5));
    
    /*
     定义一个block，用来输出n条线
     返回值为void
     有一个参数int n;
     */
    return 0;
}
