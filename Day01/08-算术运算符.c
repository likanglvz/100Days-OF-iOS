/*




*/

#include<stdio.h>
int main1(){
    int a,b,c;
    a=1;
    b=a++;//++在变量的后面,先赋值，然后再加1
    printf("b=%d,a=%d\n",b,a);//b=1,a=2
    c=++a;//++在变量的前面，先自加，然后再赋值
    printf("c=%d,a=%d\n",c,a);
    return 0;
}
/*提示用户输入一个时间的秒数，比如500秒就输入500，然后输出对应的分钟和秒，比如500s 8分钟20秒
*/

int main(){
    int time,minute,second;
    //提示用户输入
    printf("提示用户输入一个时间的秒数\n");
    //接收用户输入的值
    scanf("time=%d",&time);
    //计算对应的分钟和秒
    minute=time/60;
    second=time%60;
    //输出分钟和秒
    printf("minute=%d,second=%d\n",minute,second);
    return 0;
}








