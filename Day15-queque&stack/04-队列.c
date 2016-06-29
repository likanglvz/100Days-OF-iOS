#include<stdio.h>
#define MAX_QUEUE_SIZE 30
typedef struct{
    int size;//存数据数量
    int data[MAX_QUEUE_SIZE];
} Queque;
//入队
int inQueque(Queque * const s,int num);
//获取队列中数据
int getQueque(Queque * const s,int * const num,int index);
//出队
int outQueque(Queque * const s,int * const num);
//修改队列中某个数据
int setQueque(Queue* const s,int index,int num);

//打印队列中的数据
void printQueque(const Queque * const s);
int main(){
    int flag;
    int num;
    Queque qu={0,0};
    for (int i=0; i<4; i++) {
        flag=inQueque(&qu,i*10);
        if (flag) {
            printf("in queque success\n");
                }
        else{
            printf("in queque failed\n");
            break;
        }
    }
    printQueque(&qu);
    getQueque(&qu,&num,2);
    printf("num=%d\n",num);
    outQueque(&qu,&num);
    printQueque(&qu);

    
    
    
    
    
    return 0;
}
int inQueque(Queque * const s,int num){
    if (s->size==MAX_QUEUE_SIZE) {
        return 0;
    }
    s->data[s->size++]=num;//队尾入数据
    return 1;
}
int getQueque(Queque * const s,int * const num,int index){
    if (index<0||index>=s->size) {
        return 0;
    }
    *num=s->data[index];
    return 1;
}
int setQueque(Queue* const s,int index,int num){
    if (index<0||index>=s->size) {
        return 0;
    }
    s->data[index]=num;//修改队列中的值
    return 1;y
}

int outQueque(Queque * const s,int * const num){
    if (s->size==0) {
        return 0;
    }
    *num=s->data[0];//队头出列
    for (int i=1 ; i<s->size; i++) {
        s->data[i-1]=s->data[i];//队列中每个元素往前移动
    }
    s->size--;//出一个就少一个
    return 1;
}

void printQueque(const Queque * const s){
    printf("队列中的数据是: ");
    for (int i=0; i<s->size; i++) {
        printf("第%d元素是%d\n",i+1,s->data[i]);
    }
}
