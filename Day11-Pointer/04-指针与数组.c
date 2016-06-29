#include<stdio.h>
//数组名是数组的地址，也是数组首元素的地址
int main(){
    int a[4]={3,45,23,10};
   /* for (int i=0; i<4; i++) {
        printf("a[%d]=%d\n",i,a[i]);
    }
    */
    
    int *p=a;
//    int *p=&a[0]
   /* for (int i=0; i<4; i++) {
        printf("a[%d]=%d\n",i,*(p+i));
        //a+i*(sizeof(int))
//       printf("a[%d]的地址是:%p ",i,a+i);
        //p+i*(sizeof(int))
        printf("%p\n",p+i);
        
    }
    printf("p的变量的值%p\n",p);
    */
    for (int i=0; i<4; i++,p++) {
        printf("a[%d]=%d\n",i,*p);
    }
    printf("p的变量的值%p\n",p);
    
    
    
    return 0;
}