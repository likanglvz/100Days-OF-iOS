#include<stdio.h>
/* n：要移动的盘子的数量
   from：原始位置
   to：目标位置
   middle:中间位置
   返回值：移动的总数
 */
int moveTime=0;//全局变量
int hanNuoTa(int n,char from,char to,char middle);
int main(){
    int n;
    scanf("%d",&n);
    printf("移动盘子的总次数是：%d\n",hanNuoTa(n,'A','B','C'));
    return 0;
}

int hanNuoTa(int n,char from,char to,char middle){
    //递归的出口条件，如果只有1个盘子，直接移动（to）目的位置
    if (n==1) {
        moveTime++;
        printf("第%d步:盘子%d从%c移动到%c\n",moveTime,n,from,to);
        return 1;
    }
    hanNuoTa(n-1,from,middle,to);
    moveTime++;
    printf("第%d步:盘子%d从%c移动到%c\n",moveTime,n,from,to);
    hanNuoTa(n-1,middle,to,from);
    
    return moveTime;
}
