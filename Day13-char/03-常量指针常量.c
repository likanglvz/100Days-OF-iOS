/* 
 
 const：他可以限制一个变量是只读
 const和指针的结合
   常量指针：指针指向的变量的值是不可以修改的
       const在int *左边
   指针常量：指针存的地址是不可以修改的
   常量指针常量：指针指向的变量的值是不可以修改的，指针存的地址是不可以修改的
 
 
 
 */


#include<stdio.h>
int main(){
    int a=10,t=30;
  /* 
     //错误的，因为b是只读变量
   const int b=10;
    a=40;
    b=40;
   */
    //常量指针
    const int *p=&a;
//    *p=50;//错误的
    p=&t;
    //指针常量
    int *const pp=&a;
    *pp=90;
    pp=&t;
    
    //常量指针常量
    const int *const qq=&a;
    *qq=40;
    qq=&t;
    
    
    return 0;
}