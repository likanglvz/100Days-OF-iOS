//值传递和地址传递
#include<stdio.h>
void swap(int a,int b);
void swap1(int *a,int *b);//告诉实参要穿地址进来
int main(){
    int a=20,b=40;
    swap1(&a,&b);
    printf("实参中的数值是:a=%d,b=%d\n",a,b);
    
    
    return 0;
}
void swap(int a,int b){
    a=a^b;
    b=a^b;
    a=a^b;
    printf("形参的数值:a=%d,b=%d\n",a,b);
    return;
}
void swap1(int *a,int *b){
    *a=*a^*b;
    *b=*a^*b;
    *a=*a^*b;
    printf("形参的数值:a=%d,b=%d\n",*a,*b);
    return;
}