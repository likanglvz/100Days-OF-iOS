/*  提示用户输入一个正整数n,请计算出1-2+3-4+5-6+7-....+n的值 (1+3+5+7...+(n-1)-2-4-6-...n*/
#include<stdio.h>
int main1(){
    //n:输入的整数，i：循环的次数，sum：求和
    int n,sum,i;
    sum=0;
    i=0;
    n=0;
    while (n<=0) {
        printf("请输入一个正整数\n");
        scanf("%d",&n);
    }
    while (i<=n) {
        if (i%2==0) {
            sum-=i;
        }else{
            sum+=i;
        }
        i++;
    }
    printf("sum=%d\n",sum);
    
    
    return 0;
}


/*提示用户输入一个正整数n，计算出1*2*3*...n的值*/
int main2(){
    //n:输入的值，i:计数，multi：乘积
    int n,i,multi;
    n=0;
    i=1;
    multi=1;
    while (n<=0) {
        printf("输入一个正整数\n");
        scanf("%d",&n);
    }
    while (i<=n) {
        multi*=i;
        i++;
    }
    printf("multi=%d\n",multi);
    
    
    return 0;
}

 /*计算出1到100之间所有3的倍数的个数*/
int main(){
    int i=1;
    int count=0;//计数
    while (i<=100) {
        if (i%3==0) {
            printf("i=%d\n",i);
            count++;
        }
        i++;
    }
    printf("count=%d\n",count);
    
    
    return 0;
}













