/*
  数组：多个相同类型的数据
  结构体：可以由多个不同类型数据构成
 
 有三种方式的定义：
   1、只定义一个结构体类型，再定义变量
   2、定义结构体类型的同事定义变量
   3、定义一个结构体类型，不取名字，直接定义变量
 
 定义结构体类型并不会分配存储空间，
 定义结构体变量才会真正的分配存储空间
*/
#include<stdio.h>
int main(){
    //定义结构体类型
    //
//    struct Date{
//        int year;  //4
//        int month;//4
//        int day;//4
//    };
////     printf("sizeof(Date):%lu\n",sizeof(Date));
//    struct Date date1={2013,12,12};
//    struct Date date2={2016,9,9};//不能在数字前加0，因为加了以后编译器会认为是八进制
//    printf("sizeof(Date):%lu\n",sizeof(date1));
//    //会将date1中的所有成员值对应的赋值给date2的所有成员
//    date1=date2;
//    printf("%d/%d/%d\n",date2.year,date2.month,date2.day);
//    
//    struct Person{
//       //结构体的成员
//        char *name;
//        int age;
//        double height;
//        char sex;
//    };
//    
//    struct Person per={.age=23,.height=1.78,.sex='M',.name="jack"};
//    per.age=30;
//    printf("name=%s,age=%d,height=%f,sex=%c\n",per.name,per.age,per.height,per.sex);
//  
//    
//  /*  struct {
//        //结构体的成员
//        char *name;
//        int age;
//        double height;
//        char sex;
//    }per;
//    per.name="rose";
//    per.age=23;
//    per.height=1.65;
//    per.sex='F';
//   printf("name=%s,age=%d,height=%f,sex=%c\n",per.name,per.age,per.height,per.sex);
//*/
//
//    struct Person1{
//        //结构体的成员
//        char *name;
//        struct Date birthday;
//        double height;
//        char sex;
//    };
//    
//    struct Person1 per1={"jack",{2001,10,12},1.60,'F'};
//    printf("name=%s,birthday=%d-%d-%d,height=%f,sex=%c\n",per1.name,per1.birthday.year,per1.birthday.month,per1.birthday.day,per1.height,per1.sex);
    
    struct st{
        int age;   //4
        char *name;//8
    };
    
    printf("%lu\n",sizeof(struct st));
    return 0;
}



