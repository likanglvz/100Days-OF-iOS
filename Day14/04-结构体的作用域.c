/*
1、结构体定义在函数的外面，全局（从定义类型的那行开始，一直到文件的结束
2、结构体定义在函数的里面，从定义类型的那行开始，一值到此函数的结束

*/
#include<stdio.h>
struct Person1{
    char *name;
    int age;
};
void test(){
    struct Person2{
        char *name;
        int age;
    };
    
}

int main(){
    struct Person2 p1={"jack",23};
    struct Person1 p2={"rose",24};
    
    
    return 0;
}