/* 成员的最大的字节数的整数倍
   补齐算法：靠奇数补齐
 */


#include<stdio.h>
int main(){
    struct Per1{
        int a;//4  8-1~8-4
        short b;//2 8-5~8-6
        char *p;//8 //8
    };
    printf("%lu\n",sizeof(struct Per1));
    struct Per2{
        int a;//4
        short b;//2
        double d;//8
    };
    printf("%lu\n",sizeof(struct Per2));
    struct Per3{
        int a;//8-1~8-4
        double d;//8-1~8-8
        short b;//8-1~8-2
    };
     printf("%lu\n",sizeof(struct Per3));
    struct Per4{
        int a;//4
        char b;//4-1
        char d;//4-2
        short c;//4-3,4-4
        int e;//4
    };
     printf("%lu\n",sizeof(struct Per4));
    struct Per5{
        int a;//4
        char b;//4-1
        short c;//4-3,4-4
        char d;//4-1
        int e;//4
    };
    printf("%lu\n",sizeof(struct Per5));
    struct Per6{
        char *s1;//8
        int a;//8-1~8-4
        char s2[10];//8-5~8-8,8-1~8-6
        short b;//8-7,8-8
    };
    printf("%lu\n",sizeof(struct Per6));


    return 0;
}