/*
  定义：
      数据类型 (*指针变量)[n]
    n:第二维度
   ps:1.()是不可以省略
 
 
 二维数组的三种表示方式：
 1、指向二维数组的指针：可以直接赋值，可以移动，但是不具备通用性
 2、指针数组：不能直接赋值，需要一个初始化的过程，不能移动
 3、指针：(指向的是二维数组的第一行第一列的地址）：可以直接赋值，也可以移动，具有通用性（最好是要有行和列的大小)
 */
#include<stdio.h>
int main1(){
    //  hell0
//      chen0
//      heng0
    char arr[3][5]={"hell","chen","heng"};
    //指向二维数组的指针
    char (*p)[5]=arr;
    for (int i=0; i<3; i++){
        for (int j=0; j<5; j++) {
            //数组的第i行第j列的数据，
            p[i][j]='a';
            printf("arr[%d][%d]=%c\n",i,j,p[i][j]);
        }
    }
    return 0;
}

int main(){
    char arr[3][5]={"hell","chen","heng"};
    //指针数组
    char *p[3];
    for (int i=0; i<3; i++) {
        p[i]=arr[i];
        printf("%s\n",p[i]);
    }

    
    
    return 0;
}
