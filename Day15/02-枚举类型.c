/*
 
 枚举：当变量中就只有固定的几个值
 
*/
#include<stdio.h>
int main1(){
    //定义枚举类型
    enum Season{
        spring=2,//0
        summer=8,//1
        autumn=10,
        winter=11
    };
    //定义枚举类型的变量
    //枚举类型的固定的值是通过整型常量的值来表现的,是可以更改，一般人不会改
    enum Season s=autumn;
    printf("%d\n",s);
    return 0;
}

int main(){
    enum week{
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday
    };
    enum week w=monday;
    printf("%d\n",w);
    return 0;
}