/* while
    语法：while(condition)
        {
        循环体
     }
运行原理：
   1、如果一开始就不满足条件，永远不会进入循环
   2、如果条件成立，就会执行一次循环体，执行完毕后再次判断是否满足条件，如果满足.....
   break:跳出循环体
   continue:结束本次循环，进入下一次循环
 如何写循环：
    1、选确定循环的次数
    2、然后考虑约束条件
 */

#include<stdio.h>
int main1(){
    int i;//定义变量，计数---循环的次数
    i=1;
    while (i<=10) {//约束条件
        ++i;
        if (i%2==0) {
            printf("i=%d\n",i);
            continue;
            printf("aaaa\n");
     }
    
    }
    return 0;
}


/*提示用户输入一个正整数n，用while循环计算并输出1+2+3+....+n的和*/
int main(){
    //变量n存输入的整数，i来表示循环的次数，sum存和
    int n,sum,i;
    //i和sum初始值
    i=0;
    sum=0;
    n=0;
    //scanf("%d",&n);
    //输入的是一个正整数
    while (n<=0) {
        printf("请用户输入一个正整数\n");
        scanf("%d",&n);
    }
    //求和的循环
    while (i<=n) {
        sum+=i;//sum=sum+i;
        i++;
    }
    printf("sum=%d\n",sum);
    
    return 0;
}

/*提示用户输入一个正整数n,请计算出1-2+3-4+5-6+7-....+n的值*/

/*提示用户输入一个正整数n，计算出1*2*3*...n的值
 
/*计算出1到100之间所有3的倍数的个数*/








