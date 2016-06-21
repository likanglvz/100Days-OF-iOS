/* include:
     1、作用：copy include右边的文件的所有内容到#include所在的位置
     2、<>:系统文件。自定义的文件" "
     3、拷贝函数的声明
*/

/*  1、函数的定义放在的.c文件，函数的声明放在.h文件中
    2、如果要使用某个.c文件中定义的函数，只要需要#include这个.h文件
*/
#include<stdio.h>
#include "sum.h"
int main(){
    int a=3,b=4;
    int c=sum(a,b);
}
