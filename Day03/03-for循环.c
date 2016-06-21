  /*
     for(初始化的语句;判断条件;语句）
      {
         循环体
     }
   初始化语句：赋值
   语句：增量语句
   注意：1、一开始就会执行初始化语句（整个for循环中初始化语句只执行一次。
        2、判断条件是否成立，如果成立，就会执行循环体，然后再执行语句，再次判断条件是否成立......
   */
#include<stdio.h>
int main2(){
// int i;
  /*  for (i=1; i<=100; i++) {
        printf("i=%d\n",i);
    }
   */
    
   /* for (int i=1; i<=100; i++) {
        printf("i=%d\n",i);
    }
    */
//    printf("i=%d\n",i);
  /*  int i=1;
    for (;i<=100;) {
        i++;
        printf("i=%d\n",i);
    }
   */

 /*   //死循环
  for (;;) {
        printf("ddd\n");
    }
  */
    
    for (int i=1; i<10; i++,printf("%d\n",i)) {
        
    }

    return 0;
}
/*  提示用户输入一个正整数n,请计算出1-2+3-4+5-6+7-....+n的值 (1+3+5+7...+(n-1)-2-4-6-...n*/
int main3(){
    int n,sum;
    n=0;
    sum=0;
    while (n<=0) {
        printf("请输入一个正整数\n");
        scanf("%d",&n);
    }
    for (int i=1; i<=n; i++) {
        if (i%2==0) {
            sum-=i;
        }else{
            sum+=i;
        }
    }
    printf("sum=%d\n",sum);
    
    return 0;
}

/*提示用户输入一个正整数n，计算出1*2*3*...n的值*/

int main4(){
    int n,multi;
    n=0;
    multi=1;
    while (n<=0) {
        printf("请输入一个正整数\n");
        scanf("%d",&n);
    }
    for (int i=1; i<=n; i++) {
        multi*=i;
    }
    printf("multi=%d\n",multi);
    return 0;
}

/*计算出1到100之间所有3的倍数的个数*/
int main(){
    int count=0;
    for (int i=1; i<=100; i++) {
        if (i%3==0) {
            printf("i=%d\n",i);
            count++;
        }
    }
    printf("count=%d\n",count);
    
    
    
    return 0;
}




