/* 指向指针的指针
    我想指谁，我就要谁的地址
*/
#include<stdio.h>
int main(){
    int a=10;
    int *p=&a;
    int **pp=&p;
    int ***ppp=&pp;
    printf("p的地址%p\n",&p);
    printf("a的地址%p\n",&a);
    printf("p变量的值%p\n",p);
    printf("pp的值%p\n",pp);
    printf("pp的地址%p\n",&pp);

    return 0;
}