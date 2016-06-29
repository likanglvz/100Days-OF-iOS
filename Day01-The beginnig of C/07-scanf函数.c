/*
scanf()：调用函数时，需要传入变量的地址作为参数，scanf
 函数会等待输入设备（比如键盘）输入数据，并且将输入数据赋值给地址对应的变量。
 声明一个头文件 <stdio.h>
&--地址运算符，可以获取变量的地址
 运行时，等待后输入完毕后，要按个回车键，目的是告诉scanf函数我们已经输入完毕，scanf函数会把输入的值赋值给相应的变量
 
 ps:1、scanf函数可以接收多个数值，每个数值之间用分隔符隔开，分隔符：，-，#，*，但是我们在输入值后必须加上分隔符
    2、scanf函数的第一个参数后不能跟\n，如果包含\n，会导致scanf函数无法结束
*/
#include<stdio.h>
int main1(){
    //int i;
    //char a;
    double height;
    scanf("%lf\n",&height);
    //scanf("%d-%c",&i,&a);
    printf("height=%lf\n",height);
   // printf("i=%d,a=%c\n",i,a);
    
    
    return 0;
}
/*输入2个整数，并对2个整数进行交换*/
int main2(){
    int a,b,c;
    scanf("%d,%d",&a,&b);
    c=a;
    a=b;
    b=c;
    printf("a=%d,b=%d\n",a,b);
    
    
    return 0;
}
/*提示用户输入两个整数，然后计算出两个整数之和*/
int main(){
    int a,b;
    int sum;
    printf("请输入2个整数\n");
    scanf("%d,%d",&a,&b);
    sum=a%b;//两个整数相除之后的余数，他的正负性取决于%左侧的数值
    printf("sum=%d\n",sum);
    return 0;
}












