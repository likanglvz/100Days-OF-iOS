/* do{ 循环体 }while(条件)---进入循环的条件
 不管条件是否满足，一定会执行一次循环体
 */
#include<stdio.h>
int main(){
    int i=1;
    do{
        i++;
        printf("%d\n",i);
    }while (i<3);
    return 0;
}
