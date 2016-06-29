/*  函数定义：
     返回类型 函数名(形式参数1,....){
     函数体
 
 }
   函数定义在main函数的前面，直接定义
   函数定义在main函数的后面，要再main前进行函数的声明
 
 
 1、形参：定义函数时候函数名后面的参数
 2、实参：调用函数时传入的具体的数据
 3、形参的个数必须和参数的个数要一致
 4、函数体的内部不能定义和形参一样的变量
 5、如果是基本的数据类型作为函数的参数，纯粹是值传递,
 修改函数内部的值，并不会影响实参的值
 6、函数可以没有形参，也可以有多个形参，如果是没有形参，调用的时候（）是不能少的
   函数的注意点：1、函数名是不允许重复使用
               2、如果不明确返回的返回类型，可以不写.默认是int
               3、void代表的是无返回值类型
               4、就算你声明了返回值的类型，也可以不返回任何值
   返回值和return的作用：
    1、返回一个具体的值给调用者
    2、return的作用：退出函数
 

 */


#include<stdio.h>
void printStar();//函数的声明
int sum(int a,int b);
int change(int a,int b);
int main(){
    printStar();
    int c=sum(4,5);
    printf("c=%d\n",c);
    int a=20;
    int b=40;
    change(a,b);
    printf("main函数中：a=%d,b=%d\n",a,b);
    return 0;
}
void printStar(){
    printf("****\n");
    return ;
}
int sum(int a,int b){
    return a+b;
}
int change(int a,int b){
    a=a^b;
    b=a^b;
    a=a^b;
    printf("change:a=%d,b=%d\n",a,b);
    return 0;
}




