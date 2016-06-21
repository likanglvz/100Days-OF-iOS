/*
 题目：
 1!+2!+3!+……+n!的值（n>=1）。
 比如n=3的返回值是1! + 2! + 3! = 1 + 1*2 + 1*2*3 = 9
 */

#include<stdio.h>
int main1(){
    int n,multi,sum;
    scanf("%d",&n);
    sum=0;
    for (int i=1; i<=n; i++) {//累加
       multi=1;
        for (int j=1; j<=i; j++) {//乘积
            multi*=j;
        }
        sum+=multi;
        
    }
    printf("sum=%d\n",sum);

    return 0;
    
}


/*定义一个函数，接收2个整型参数m、n，返回两个整数m和n的最大公约数，在main函数中接收终端输入后调用该函数，并输出结果
 
 */
int gcd(int m,int n);
int gcd1(int m,int n);
int main3(){
    int m,n;
    scanf("%d,%d",&m,&n);
    printf("最大公约数是%d\n",gcd(m,n));
    printf("最大公约数是%d\n",gcd1(m,n));
    return 0;
}
int gcd(int m,int n){
    int k,x;//k:存储最小的值,x:存最大公约数
    if (m>n) {
        k=n;
    }else{
        k=m;
    }
    for (int i=1; i<=k; i++) {
        if (m%i==0 && n%i==0) {
            x=i;
        }
    }
    return x;
}

int gcd1(int m,int n){
    int a;
    if (m>=n) {
        m=m^n;
        n=m^n;
        m=m^n;
    }
    a=n%m;
    while (a!=0) {
        n=m;
        m=a;
        a=n%m;
    }
    return m;
}

/*定义一个函数，接受一个整数n，输出相应的菱形。如右图，当传入的实参是4时*/
//    *
//   * *
//  * * *
// * * * *
//* * * * *
// * * * *
//  * * *
//   * *
//    *
#include<stdio.h>
void printLing(int n);
int main(){
    int n;
    scanf("%d",&n);
    printLing(n);
    return 0;
}
void printLing(int n){
    for (int i=1; i<=n; i++) {//上半部分的行数
        for (int j=1;j<=n-i+1; j++) {//空格
            printf(" ");
        }
        for (int k=1; k<=i; k++) {//打印*空格
            printf("* ");
        }
        printf("\n");
    }
    for (int i=1; i<=n+1; i++) {//行数
        for (int j=1; j<=i-1; j++) {//空格
            printf(" ");
        }
        for (int k=1; k<=n-i+2; k++) {
            printf("* ");
        }
        printf("\n");
    }
    return ;
}






