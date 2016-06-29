#include<stdio.h>
/*
    int *p;
     int a[5]={2,3,4,5,6};
     p=a;
    for(int i=0;i<5;i++){
     printf("a[%d]=%d\n",i,a[i]);
    printf("a[%d]=%d\n",i,p[i]);
 //p+i*sizeof(int)
 printf("a[%d]=%d\n",i,*(p+i));
  printf("a[%d]=%d\n",i,*p++);
 }
 每个函数可返回一个值，返回值可以是char，int，float，double类型，当返回值类型如果设置成void，表示函数没有返回值。
 在c语言中，还允许一个函数的返回值是一个指针（地址）,叫指针型函数或者返回指针的函数
      定义的格式：
             数据类型 *函数名(arg1,...){
   }
   一般会用这种函数返回一个字符串常量的首地址
 
 */
char *test(){
    return "chenxp";
}

int main4(){
    char *name=test();
    printf("%s\n",name);
    
    return 0;
}
/*
 1--January
 2--february
 3--march
 4--april
 5--may
 6--june
 7--july
 8-august
 9--september
 october
november
 december
 */

//根据输入的要月份，输出对应的英文名字
char *charMonth(int month);
int main(){
    int i;
    scanf("%d",&i);
    printf("%d--->%s\n",i,charMonth(i));
    return 0;
}
char *charMonth(int month){
    char *str_month[]={"Illegal Month","January","February","March","April","May","June","July","August","September","October","November","December"};
    char *p;
    if (month>=1&&month<=12) {
        p=str_month[month];
    }else{
        p=str_month[0];
    }
    return p;
}
