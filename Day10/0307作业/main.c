//
//  main.c
//  0307作业
//
//  Created by AppleUser on 16/3/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//



//1、编写一个函数，接收2个字符串s和字符串t,把t字符串连接到s字符串的后面，变成一个字符串


#include <stdio.h>
int putte(char a[],char b[]);

int main() {
    char s[]="wergq";
    char t[]="poafku";

    putte(s,t);
    printf("%s\n",s);
    return 0;
}
int putte(char a[],char b[]){
    int i=0;
    while (a[i++]!=0);
    i=i-1;
    int j=0;
    while (b[j]!=0) {
        a[i]=b[j];
        i++;
        j++;
    }
    a[i]=0;
    
    return 0;
}


//2、快速排序
//首先任意选取一个数据（通常选用数组的第一个数）作为关键数据，然后将所有比它小的数都放到它前面，所有比它大的数都放到它后面，这个过程称为一趟快速排序
//#include<stdio.h>
//void readList(int a[],int n);
//int  paixu(int a[],int n);
//int  main(){
//    int a[6];
//    readList(a, 6);
//    paixu(a,6);
//return 0;
//}
//
//void readList(int a[],int n){
//    for (int i=0; i<n; i++) {
//        scanf("%d",&a[i]);
//    }
//}
//int  paixu(int a[],int n){
//    int k=0;
//    if (n==1) {
//        printf("%d",a[0]);
//    }
//    if (a[n-1]<a[n-2]) {
//        k=a[n-2];
//        a[n-2]=a[n-1];
//        a[n-1]=k;
//    }
//    for (int i=0; i<n; i++) {
//        printf("%d",a[i]);
//    }
//
//    return 0;
//    }
//



















