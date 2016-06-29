/* malloc(size):
 size:要凑到最大数据类型所占字节的整数倍
 
 realloc(void *p,size_t size):
 size 连续存储空间。
 如果p的地址满足size的要求，在原始位置的空间后增加。
 如果p的地址不能满足size的要求，则重新分配，将原来的地址的数据复制到现在的空间上
 
*/

#include <stdio.h>
#include <stdlib.h> 
int main1(void)
{
    int *p1 = malloc(4*sizeof(int));  // allocates enough for an array of 4 int
    int *p2 = malloc(sizeof(int[4])); // same, naming the type directlyi
    int *p3=malloc(4*sizeof *p3);
  //  int *p3 = malloc(4*sizeof *p3);   // same, without repeating the type name
    
    if(p1) {
        for(int n=0; n<4; ++n) // populate the array
            p1[n] = n*n;
        for(int n=0; n<4; ++n) // print it back out
            printf("p1[%d] == %d\n", n, p1[n]);
    }
    
    free(p1);
    free(p2);
    free(p3);
}

int main(){
    void *p=malloc(12);//
    int *x=p;//
    printf("x=%p\n",x);
    for (int i=0; i<4; i++) {
        x[i]=i;
    }
    
//    for (int i=0;i<4;i++) {
//        printf("x[%d]=%d %p",i,x[i],x+i);
//        
//    }
    //增加2个整数
    int *q;
    q=realloc(x,10);
    printf("q=%p\n",q);
    q[4]=40;
    q[5]=50;
    
    for (int i=0; i<6; i++,q++) {
        printf("q[%d]=%d\n",i,*q);
    }
    free(p);
    free(q);
    return 0;
}





