/* 二维数组:  
    数据类型  数组名[整型表达式1][整型表达式2]
*/

#include<stdio.h>
int main(){
    int a[3][4]={{1,2,3,4},{3,4,5,6},{5,6,7,8}};
    int b[][4]={1,2,3,3,4,5,6,7,8,9,10,11};//可以一维的维度
    int c[]={1,2,3};
    //二维数组中每个元素输出
    printf("a:%p\n",a);
    for (int i=0; i<3; i++) {//行数
        printf("a[%d]=%p\n",i,a[i]);
        for (int j=0; j<4; j++) {
            printf("a[%d][%d]=%d ",i,j,a[i][j]);
            printf("a[%d][%d]=%p\n",i,j,&a[i][j]);
        }
    }
    
    
    return 0;
}