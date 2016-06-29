//
//  main.c
//  0309
//
//  Created by AppleUser on 16/3/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

//#include <stdio.h>
//char *c( int a);
//int main() {
//    int n;
//    scanf("%d",&n);
//    printf("%s\n",c(n));
//    
//    return 0;
//}
//char *c(int a){
//    switch (a) {
//        case 1:return "jan";break;
//        case 2:return"feb";break;
//        case 3:return"mar";break;
//        case 4:return"apr";break;
//        case 5:return"may";break;
//        case 6:return"jun";break;
//        case 7:return"jul";break;
//        case 8:return"aug";break;
//        case 9:return"sep";break;
//        case 10:return"oct";break;
//        case 11:return"nov";break;
//        case 12:return"dec";break;
//    }
//    return 0;
//}

//#include<stdio.h>
//int sum(int a,int b){
//  return a+b;
//}
//int main(){
//    int (*p)(int a,int b);
//    p=sum;
//    int c=(*p)(12,34);
//    printf("%d\n",c);
//    
//    return 0;
//}

#include<stdio.h>
int main1(){
    char arr[3][5]={"hell","chen","heng"};
    char (*p)[5]=arr;
    for (int i=0; i<3; i++) {
        for (int j=0; j<5; j++) {
            printf("arr[%d][%d]=%c\n",i,j,*(*(p+i)+j));
        }
    }
    return 0;
}

#include<stdio.h>
int main2(){
    char arr[3][5]={"hell","chen","heng"};
    char *p[3];
    for (int i=0;i<3; i++) {
        p[i]=arr[i];
        printf("%s\n",p[i]);
        
    }
    return 0;
}








#include<stdio.h>
#define M 3
#define N 2
void avg(float *p,int cnt);
void search(float (*p)[N],int m);
void sum(float (*p)[N],int n);
void notpass(float **p);
int main(){
    float score[M][N]={89 ,24,87,75,73,79};
    int cnt=M*N;
    avg(score, cnt);
    search(score, 2);
    sum(score,1);
    float *q[M];
    for (int i=0; i<M; i++) {
        q[i]=score[i];
    }
    notpass(q);
    return 0;
}
//void avg(float *p,int cnt){
//    float score[M][N];
//    float (*q)[N]=score;
//    float sum=0;
//    for (int  i=0; i<M; i++) {
//        for (int j=0; j<N; j++) {
//            sum+=q[i][j];
//        }
//    }
//    int z=M+N;
//    float avg=sum/z;
//    printf("%lf\n",avg);
//}
void avg(float *p,int cnt){
    float sum=0;
    for (int i=0; i<cnt; i++) {
        sum+=*(p+i);
    }
    printf("平均成绩是%f\n",sum/cnt);
}
//void search(float (*p)[N],int m){
//    for (int i=0; i<N; i++) {
//           printf("%f\n", p[m-1][i]);
//        }
//}
void search(float (*p)[N],int m){
    if (m>M){
        printf("输入有误\n");
        return;
    }
    p=p+m-1;
    for (int i=0; i<N; i++) {
        printf("%f\n",*(*p+i));
    }
}

void sum(float (*p)[N],int n){
    if (n<1||n>N) {
        printf("输入有误");
        return;
    }
    float a=0;
    for (int i=0; i<M; i++) {
        a+=p[i][n-1];
        }
     printf("第%d门课的总分%f\n",n,a);
}
void notpass(float **p){
    for (int i=0; i<M; i++) {
        for (int j=0; j<N; j++) {
            if (p[i][j]<60){
                for (int k=0; k<N; k++) {
                    printf("%f\n",p[i][k]);

                 }break;
            }
        }
    }
    
}





















