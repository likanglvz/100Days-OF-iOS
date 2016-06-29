/*  指针
  &：取地址
  *:定义的时候出现,表示是指针,非定义的时候，*代表的是取值
  指针变量：
      定义：数据类型 *变量名。
    只能存放存储地址。
    作用：根据一个地址值，访问到对应的地址的存储空间的数据
 指针变量p只能指向相同类型的数据的地址
*/
#include<stdio.h>
/*void change(int *n);
int main(){
    int a=90;
    change(&a);
    printf("%d\n",a);
    return 0;
}
void change(int *n){
    *n=10;
}
*/
int main1(){
   /* int *p,a=50;
    int b=23;
    char h=65;
    p=&a;//指针变量p指向了变量a
    printf("a=%d\n",a);
    printf("*p=%d\n",*p);
    p=&b;
    printf("*p=%d\n",*p);
    */
   /* p=&h;//错误的写法
    printf("*p=%d\n",*p);
    */
    /* 指针变量只能指向地址
    int *p1;
    p1=100000;
     */
   /* int *p1,a1=30;
    p1=&a1;
    *p1=100;

    printf("a1=%d\n",a1);
    */
    /*错误的写法
    int *p,a=70;
    *p=&a;
     */
    int *p,a=70;
    p=&a;
    printf("a的地址%p\n",&a);
    printf("p的值：%p\n",p);
    printf("p的地址%p\n",&p);
    /*错误的，禁止未初始化或者复制的指针
    int *q;
    printf("q的值是:%p\n",q);
     */
    
//    int *p1=&a1;

    return 0;
}
int addAndMinus(int a,int b,int *minus);
int main(){
  /*  int i=2;
    char c=1;
    char *p;
    p=&c;
    printf("*p=%d\n",*p);
    int *q;
    q=&c;
    printf("*q=%d\n",*q);
   */
    int a=40,b=29,sum=0,minus=0;
    sum=addAndMinus(a,b,&minus);
    printf("sum=%d,minus=%d\n",sum,minus);
    return 0;
}
/*写一个函数，求2个数的和与差*/
int addAndMinus(int a,int b,int *minus){
     *minus=a-b;
     return a+b;
   
}


 
 
