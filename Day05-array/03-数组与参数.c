/*数组作为函数的形式参数时，写可以省略元素的个数
 数组作为函数的实际参数时，只要写数组名
 */

#include<stdio.h>
void change(int a[]);
int main(){
//    
    int a[8]={2,3,4,6,7,8,4,3};
    change(a);
//    for (int i=0; i<4; i++) {
//        printf("a[%d]=%d\n",i,a[i]);
//    }
    int a1;
    a1=sizeof(a);
    printf("a1=%d\n",a1);
    
    return 0;
}
void change(int a[]){
    //数组当做函数的参数传递时，会当做指针变量来使用，
    指针变量在64位系统中占8个字节
    int size=sizeof(a);//8---指针的字节数
    printf("size=%d\n",size);
    a[3]=21;
    return;
}