
#include<stdio.h>
//输入数据到数组中
void readList(int list[],int n);
//打印数组中的数据
void printList(int list[],int n);
void bubbleSort(int list[],int n);
void selectSort(int list[],int n);
void swap(int *x,int *y);
int main(){
   // int a[]={10,20,4,2,50,1};
    int a[7]={0};
    readList(a,7);
    printf("排序前的数组:\n");
    printList(a,7);
//    bubbleSort(a,7);
    selectSort(a,7);
    printf("排序后的数组:\n");
    printList(a,7);
    return 0;
}
void bubbleSort(int list[],int n){
    for (int i=0; i<n-1; i++) {//轮数
        for (int j=0; j<n-1-i; j++) {
            if (list[j]>list[j+1]) {
//                list[j]=list[j]^list[j+1];
//                list[j+1]=list[j]^list[j+1];
//                list[j]=list[j]^list[j+1];
                swap(&list[j],&list[j+1]);
            }
        }
    }
    
}
void swap(int *x,int *y){
    int temp;
    temp=*x;
    *x=*y;
    *y=temp;
    return;
}
void readList(int list[],int n){
    for (int i=0; i<n; i++) {
        scanf("%d",&list[i]);
    }
}
void printList(int list[],int n){
    for (int i=0; i<n; i++) {
        printf("list[%d]=%d\n",i,list[i]);
    }
}
void selectSort(int list[],int n){
    for (int i=0; i<n-1; i++) {//轮次
        for (int j=i+1; j<n; j++) {
            if (list[i]>list[j]) {
                swap(&list[i],&list[j]);
            }
        }
    }
    
    
    
    
    
}
