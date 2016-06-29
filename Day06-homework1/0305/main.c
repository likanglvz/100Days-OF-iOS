//
//  main.c
//  0305
//
//  Created by AppleUser on 16/3/5.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

//1、给定一个整数数组，将其按照大小顺序重新排列。
//#include<stdio.h>
//int main(){
//    int a[5]={2,3,1,4,5,};
//    int i;
//    for (i=0; i<5; i++) {
//            if (a[i]>a[i+1]) {
//                a[i]=a[i]^a[i+1];
//                a[i+1]=a[i]^a[i+1];
//                a[i]= a[i]^a[i+1];
//        }printf("%d\n",a[i]);
//    }
//
//    return 0;
//}


#include<stdio.h>
int main(){
    int a[10];
    int i,j,k;
    for (int i=0; i<10; i++) {
        printf("请输入数字");
        scanf("%d",&a[i]);
    }
    for (j=0; j<9;j++) {
        for (i=0; i<9-j; i++) {
            if (a[i]>a[i+1]) {
                k=a[i];
                a[i]=a[i+1];
                a[i+1]=k;
            }
        }
    }
    for (i=0; i<10; i++) {
        printf("%d  ",a[i]);
    }
    return 0;
}



    
//2、计算2个3*3的行列式的乘法结果。
//行列式乘法规则：
//行列式A：								行列式B：
//a11   a12   a13						b11   b12   b13
//a21   a22   a23						b21   b22   b23
//a31   a32   a33						b31   b32   b33
//A*B的结果是：
//a11*b11+a12*b21+a13*b31  a11*b12+a12*b22+a13*b32  a11*b13+a12*b23+a13*b33
//a21*b11+a22*b21+a23*b31  a21*b12+a22*b22+a23*b32  a21*b13+a22*b23+a23*b33
//a31*b11+a32*b21+a33*b31  a31*b12+a32*b22+a33*b32  a31*b13+a32*b23+a33*b33
//
//#include<stdio.h>
//int main(){
//    int a[3][3]={1,2,3,4,5,6,7,8,9};
//    int b[3][3]={1,2,3,4,5,6,7,8,9};
//    for (int j=0; j<3; j++) {
//        
//        for (int i=0; i<3; i++) {
//            int sum=0;
//            for (int k=0; k<3; k++) {
//                sum+=a[j][k]*b[k][i];
//            }
//            printf("%d  ",sum);
//        }
//        printf("\n");
//        
//    }
//    return 0;
//}









//给定存放整数的一个M*N的二维数组。定义一个方法将其转存到一个N*M的数组中。
//#include<stdio.h>
//int main(){
//    int a[4][3]={1,2,3,4,5,6,7,8,9,10,11,12};
//    int b[3][4];
//    int i,j;
//    for (i=0; i<=3; i++) {
//        for (j=0; j<=2; j++) {
//            b[j][i]=a[i][j];
//        }
//    }
//    for (i=0; i<=2; i++) {
//        for (j=0; j<=3; j++) {
//            printf("%d  ",b[i][j]);
//            
//        }printf("\n");
//    }
//    
//    
//    
//    
//    
//    return 0;
//}
