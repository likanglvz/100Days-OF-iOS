//
//  main.c
//  03061
//
//  Created by 李康 on 16/3/6.
//  Copyright © 2016年 李康. All rights reserved.
//给定存放整数的一个M*N的二维数组。定义一个方法将其转存到一个N*M的数组中。
#include<stdio.h>
int main(){
    int a[4][3]={1,2,3,4,5,6,7,8,9,10,11,12};
    int b[3][4];
    int i,j;
    for (i=0; i<=3; i++) {
        for (j=0; j<=2; j++) {
            b[j][i]=a[i][j];
        }
    }
    for (i=0; i<=2; i++) {
        for (j=0; j<=3; j++) {
            printf("%d  ",b[i][j]);
            
        }printf("\n");
    }
    
    
    
    
    
    return 0;
}