/*关键字：是c语言提供的有特殊含义的符号“保留字”
  32
int  return
 
  特征：
   1、全部小写
   2、开发工具中有特殊颜色显示
 
 标识符
 程序中自定义的一些符号和名称。程序员定义
 命名规则：
   1、26个字母（大小写），10个数字（0-9），_(下划线）组成
   2、严格区分大小写，test  TEST
   3、不能以数字开头
   4、不可以使用关键字作为标识符
 
 注释：
 
   单行注释：//
   多行注释：中间的内容就是注释
 注释是给人看的，不是给计算机的，所以编译的时候不会被编译到.O文件中
 
*/
/*
 Hello, world !
 Welcome to the C language world
*/
#include<stdio.h>
int main(){
    printf("Hello, world !\n");
    printf("Welcome to the C language world\n"); 
    return 0;
}
 
