/*  变量的内存分析
  1、字节和地址
     内存以"字节”为单位：以十六进制表示地址(0x   )
 char
 int
 float
 double
 ps:内存是由大到小寻址，优先分配内存地址比较大的字节给变量
    int a=20;
    int b=45;
 a的地址比b的地址大
 每一个变量都有地址：第一个字节的地址就是变量的地址
 &
 %p---输出地址的占位符
 &--取地址
 */

#include<stdio.h>
int main(){
    int a=20;
    int b=45;
    printf("a的地址：%p\n",&a);
    printf("b的地址:%p\n",&b);
    return 0;
}
 
 
 
 
