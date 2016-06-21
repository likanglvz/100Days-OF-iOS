#include<stdio.h>

/*  总结：
 1、指向结构体的指针的定义
     struct  结构体名 *指针变量名；
 2、利用指针访问结构体的成员
     a、（*指针变量名).成员
     b、指针变量名->成员
 
 ps：结构体是可以嵌套的，但是不能自己嵌套自己
 
 */
struct Person{
    char *name;
    int age;
};
void printStruct(const struct Person *p){
    
    printf("name=%s,age=%d\n",p->name,p->age);
    
}


int main(){

    //指针变量p将来指向的是struct Person类型的变量
    struct Person *p;
    struct Person per1={"test",23};
    //指针变量指向per1的变量
    p=&per1;
    //输出值第一种方式：
    printf("name=%s,age=%d\n",(*p).name,(*p).age);
    //第二种方式->（最常用的）
      printf("name=%s,age=%d\n",p->name,p->age);
    printStruct(p);
    return 0;
}
