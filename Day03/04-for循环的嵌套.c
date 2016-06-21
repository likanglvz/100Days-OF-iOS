/*
  好友列表1
     好友1
     好友2
     好友3
  好友列表2
     好友1
     好友2
     好友3
  好友列表3
     好友1
     好友2
     好友3
 break:
   使用场合：1、switch中退出整个switch语句
           2、循环终止，退出整个循环
                   while
                   do...while
                    for
          ps:对最近的循环结构有效
 continue：
         1、循环语句：结束本次循环，进入下一轮循环
                        while
                        do...while
                        for
        ps：对最近的循环结构有效
*/
#include<stdio.h>
int main1(){
    for (int i=1; i<=3; i++) {
        printf("好友列表%d\n",i);
     /* printf("好友1\n");
        printf("好友2\n");
        printf("好友3\n");
      */
        for (int j=1; j<=3; j++) {
            printf("好友%d\n",j);
    
        }
        break;
    }
    
    
    return 0;
}

/*
   提示用户输入一个正整数，如果n=5，就输出下列图形
 *****
 ****
 ***
 **
 *
*/

int main3(){
    int n=0;
    while (n<=0) {
        printf("请输入一个正整数\n");
        scanf("%d",&n);
    }
    //打印图案
    for (int i=0; i<n; i++) {//有多少行
        for (int j=0; j<n-i; j++) {//每行有多少颗*
            printf("*");
        }
        printf("\n");//换行
    }
    return 0;
}
/*提示用户输入一个小于10的正整数n，如果n=5，就输出一下图形
 1
 22
 333
 4444
 55555
 */
int main4(){
    int n=0;
    //输入一个小于10的正整数n
    while (n<=0||n>=10) {
        printf("请输入一个小于10的正整数\n");
        scanf("%d",&n);
    }
    for (int row=1; row<=n; row++) {//行数
        for (int col=1; col<=row; col++) {//数字的个数
            printf("%d",row);
        }
        printf("\n");
    }
    
    return 0;
}

/*提示用户输入一个小于10的正整数n,如果是n=5，输出
 54321
 5432
 543
 54
 5
*/
int main(){
    int n=0;
    while (n<=0||n>=10) {
        printf("请输入一个小于10的正整数\n");
        scanf("%d",&n);
    }
    //输出图案
    for (int row=1; row<=n; row++) {//输出的行数
        for (int col=n; col>=row; col--) {//输出每行的数字
            printf("%d",col);
        }
        printf("\n");
    }
    
    return 0;
}












