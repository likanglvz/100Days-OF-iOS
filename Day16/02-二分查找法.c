/*1.有序的
  2.必须是线性表的顺序
*/
#include<stdio.h>
#define MAX 100
#define N 10
typedef struct{
    int  size;
   int data[MAX];
} SequenceList;
int binarySearch(SequenceList *s,int key);
int main(){
    //定义并初始化
    SequenceList s;
    for (int i=0; i<N; i++) {
        s.data[i]=i*10;
    }
    s.size=N;
    int j;
    j=binarySearch(&s,50);
    if (j!=-1) {
        printf("50在列表中的位置是：%d\n",j+1);
    }else{
        printf("sorry,not found\n");
    }
    
    return 0;
}
int binarySearch(SequenceList *s,int key){
    int low=0;
    int high=s->size-1;
    while (low<=high) {
        int middle=(low+high)/2;
        if (s->data[middle]==key) {
            return middle;
        }else{
            //缩小上限
            if (s->data[middle]>key)
                high=middle-1;
            //扩大下限
            else
                low=middle+1;
        }
    }
    
    return -1;//没有找到
}