#include<stdio.h>
/* 逻辑与
     格式  条件a&&条件b -两个条件同时成立，返回1，否则返回0
     结合方向：自左往右结合
   逻辑或
      格式  条件a||条件b---两个条件只要有一个成立，返回1，否则返回0
   逻辑非：！--0是1，1是0
 ()>负号>算术运算符>关系运算符>逻辑运算符（！>&&>||)

*/
int main(){
    int a=2,b=3;
    int d=a>1&&b>4;
    printf("d=%d\n",d);
    int c=a>1||b>4;
    printf("c=%d\n",c);
    int e=!(a>1);
    printf("e=%d\n",e);
    //逻辑运算符的优先级 ！>&&>||
    int f=!a>1&&b>4;
    printf("f=%d\n",f);
    
    int r=4+3||3<4;
    printf("r=%d\n",r);
    
    
    return 0;
}