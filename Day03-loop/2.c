//计算1!+2!+3!+……+n!的值


//#include<stdio.h>
//int main(){
//    int n;
//    int b=1;
//    int sum=0;
//    scanf("%d",&n);
//    for (int i=1; i<=n;) {
//        b*=i;
//        i++;
//        sum+=b;
//    }
//    printf("sum=%d\n",sum);
//    return 0;
//}




/*定义一个函数，接收2个整型参数m、n，返回两个整数m和n的最大公约数，在main函数中接收终端输入后调用该函数，并输出结果*/


//#include<stdio.h>
//int getMaxz(int a,int b);
//int main(){
//    int a,b;
//    int y;
//    int z=1;//y是约数，z是最大的约数
//    scanf("%d,%d",&a,&b);
//    for (y=1; y<=a&&y<=b; y++) {
//        if (a%y==0&&b%y==0) {
//            if (y>z) {
//                z=y;
//            }
//        }
//    }
//    printf("%d\n",z);
//    return 0;
//}
//int getMaxz(int a,int b){
//    return 0;
//}




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
int main(){
    int n,i,j;
    scanf("%d",&n);
    for (i=1;i<=2*n+1;i++) {
        if (i<=n+1,i++) {
            for (j=i;j<=i;j++) {
                printf("*");
            }
        }else{
            for (j=2*n+2-i; j>n+1;j++) {
                printf("*");
            }
        }
        printf("\n");
    }
    return 0;
}




































