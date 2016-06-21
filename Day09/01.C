#include<stdio.h>
/*
    0:\0代表一个结束符
      1、字符串的结束标志
      2、%s：占位符，用来输出字符串
     printf("%s\n",a2);---从a2地址开始输出字符，直到遇到\0或者0结束符为止；
 
 
 */
int main(){
/*    char a[5]={'a','b','c',65,66};
    char a1[]={'a','b','v'};
    char a2[]="hello";//字符串"hello"='h'+'e'+'l'+'l'+'o'+'\0':结束符
    printf("%lu\n",sizeof(a));
    printf("%lu\n",sizeof(a1));
    printf("%lu\n",sizeof(a2));
    printf("%s\n",a2);
    for (int i=0; i<5; i++) {
//        printf("a[%d]=%c\n",i,a[i]);
        printf("a2[%d]=%c\n",i,a2[i]);
    }
 */
    
    
    char a1[6]={65,'a','b','c'};
    char a2[]={'a','b','c'};
    char a3[6]="hell ";
    char a4[]="hell";
    printf("%lu\n",sizeof(a1));//6
    printf("%lu\n",sizeof(a2));//3
    printf("%lu\n",sizeof(a3));//6
    printf("%lu\n",sizeof(a4));//5
      printf("%s\n",a1);//Aabc
      printf("%s\n",a2);//abcAabc
      printf("%s\n",a3);//hell
      printf("%s\n",a4);//hell
    
    
    
    
    
    
    return 0;
}