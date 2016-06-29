/* switch
   switch(条件){
      case 常量1:
       语句;
       break;
      case 常量2:
       语句;
       break;
      .....
       case 常量n:
        语句;
         break;
      [default:
        语句;
       ]
}
1、break:退出整个switch语句
 2、如果case后面没有break，就会执行后面所有case语句，直到遇到break为止
 
 if和switch语句的比较：
   1、if语句能完成的功能，switch不一定能完成
   2、有些情况下，if和switch可以互换
*/
#include<stdio.h>
int main1(){
    char a;
    scanf("%c",&a);
    switch (a) {
        case 'A':
            printf("A\n");
           // break;
        case 'B':
            printf("B\n");
           // break;
        case 'C':
            printf("C\n");
            break;
        default:
            printf("other\n");
            break;
    }
    return 0;
}
/*输一个整数代表月份，根据月份输出对应的季节
 春季：3，4，5
 夏季：6，7，8
 秋季：9，10，11
 冬季：12，1，2
 */
int main3(){
    int month;
    printf("请输出月份\n");
    scanf("%d",&month);
    switch (month) {
        case 3:
        case 4:
        case 5:
            printf("春季\n");
            break;
        case 6:
        case 7:
        case 8:
            printf("夏季\n");
            break;
        case 9:
        case 10:
        case 11:
            printf("秋季\n");
            break;
        case 12:
        case 1:
        case 2:
            printf("冬季\n");

    }
    
    return 0;
}

/*输入一个整数代表分数，根据分数输出等级(A-E)
 A:90-100
 B:80-89
 C:70-79
 D:60-69
 E:0-59
 */
int main(){
    int score;
    printf("请输入分数\n");
    scanf("%d",&score);
    if (score>=0&&score<=100) {
    switch (score/10) {
        case 10:
        case 9:
            printf("A\n");
            break;
        case 8:
            printf("B\n");
            break;
        case 7:
            printf("C\n");
            break;
        case 6:
            printf("D\n");
            break;
        default:
            printf("E\n");
 
    }
}
    
    return 0;
}


