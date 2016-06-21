/*
   数组：存储相同类型的数据
特点：1、相同的数据类型
     2、内存中地址是连续
     3、里面存放的数据称为“元素"
  定义：  数据类型 数组名[元素的个数]
 ps:1、数组名是数组的地址，他和数组的第一元素的地址是一样的
    2、数组元素的存放是地址小的，和内存的寻址相反
    3、数组定义完毕后要进行初始化
    4、元素的个数必须是常量，不能是变量
 
 
*/
#include<stdio.h>
int main1(){
//    //定义数组;
//    int ages[4]={20,23,12,32};//定义的同时赋值
//    char names[4];
//    //先定义然后再赋值
//    names[0]='A';
//    names[1]='B';
//    names[2]='c';
//    names[3]='d';
//    
//    for (int i=0; i<4; i++) {
//        printf("ages[%d]=%d\n",i,ages[i]);
//        printf("names[%d]=%c\n",i,names[i]);
//    }
    
    
    /*int a[];//错误的写法*/
    int a[]={1,3,6};
    int b[3]={[1]=12,[0]=15,[2]=34};//可以指定对数组中第几个元素进行赋值
    printf("b的地址是：%p\n",b);
    for (int i=0; i<3; i++) {
        printf("%d\n",b[i]);
        //输出每个元素的地址，%p
        printf("%d的地址是:%p\n",b[i],&b[i]);
    }
    
    
    return 0;
}
int main(){
    //定义一个能存放5个整数的数组
    int a[5]={0};//对每个元素赋初始值0
    //平均：avg,求和:sum,最大值：max，最小值：min
    int sum=0,max,min;
    double avg;
    printf("请输入整数到数组中:\n");
    for (int i=0; i<5; i++) {
        scanf("%d",&a[i]);
        sum+=a[i];
    }
    avg=(double)sum/5;
    max=a[0];
    min=a[0];
    for (int j=0; j<5; j++) {
        if (max<=a[j]) {
            max=a[j];
        }
        if (min>=a[j]) {
            min=a[j];
        }
    }
    printf("min=%d\n",min);
    printf("max=%d\n",max);
    printf("avg=%lf\n",avg);
    return 0;
}