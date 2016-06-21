#include<stdio.h>
/* 编写一个函数，获取2个数的最大值，并调用*/


int getMax(int a,int b);//函数的声明
/*定义一个函数，接收2个整数，分别表示年份和月份，返回该月有
 多少天（考虑闰年）*/
/*能被4整除同时不能被100整除或者能被400整除*/
int isLeap(int year,int month);
//定义一个函数，接收1个整型参数，判断是否是质数（0---不是，1---是）1和2以及只能被1和他本身整除的数
int isPrime(int a);
int main(){
    int a=20;
    int b=45;
    int max=getMax(a,b);//函数的调用
    printf("max=%d\n",max);
    int year;
    int month;
    scanf("%d,%d",&year,&month);
    int day=isLeap(year,month);
    printf("%d年的%d月是%d天",year,month,day);
    int num;
    scanf("%d",&num);
    if (isPrime(num)) {
        printf("num=%d是质数\n",num);
    }else
    {
        printf("num=%d不是质数\n",num);

    }
    return 0;
}
int getMax(int a,int b){
    return (a>b?a:b);
}
int isLeap(int year,int month){
   // int day;
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
//            day=31;
//            break;
            return 31;
        case 4:
        case 6:
        case 9:
        case 11:
//            day=30;
//            break;
            return 30;
        case 2:
        {
            if ((year%4==0&&year%100!=0)||year%400==0) {
                return 29;
            }else{
                return 28;
            }
         }
//            break;
        default:
            printf("输入错误\n");
            return -1;
    }

}

int isPrime(int a){
    if(a==1||a==2){
        return 1;
    }
    for (int i=2; i<a; i++) {
        if (a%i==0) {
            return 0;
        }
    }
    return 1;
}










