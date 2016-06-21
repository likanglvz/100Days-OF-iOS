#include<stdio.h>
#define MAX_CYCLEQUEQUE_SIZE 10
typedef struct{
    int size;
    int front;
    int rear;
    int data[MAX_CYCLEQUEQUE_SIZE];
} circleQueque;
//入循环队列
int inCircleQueque(circleQueque *const cq,int num);
//获取循环队列中给定下标的数据
int getCircleQueque(circleQueque *const cq,int *const num,int index);
//修改循环队列中给定下标的数据
int setCircleQueque(circleQueque *const cq,int num,int index);
//出循环队列

int outCircleQueque(circleQueque *const cq,int *const num);
//打印循环队列
void printCircleQueque(const circleQueque *const cq);

int main(){
    circleQueque cq={0,0,0,0};
    int flag;
    int num;
    for (int i=0; i<13; i++) {
        flag=inCircleQueque(&cq,i*5);
        if (flag) {
            printf("in circlequeque success\n");
        }else{
            printf("in circlequeque failed\n");
            break;
        }
    }
    printCircleQueque(&cq);
    for (int i=0; i<3; i++) {
        flag=outCircleQueque(&cq,&num);
        if (flag) {
            printf("out success\n");
        }else{
            printf("out failed\n");
            break;
            
        }
    }
    printCircleQueque(&cq);
    return 0;
}
int inCircleQueque(circleQueque *const cq,int num){
    if (cq->size==MAX_CYCLEQUEQUE_SIZE) {
        return 0;
    }
    cq->data[cq->rear++]=num;//在尾部加入数据
    cq->rear%=MAX_CYCLEQUEQUE_SIZE;//判断rear的位置（rear可以循环的
    cq->size++;
    return 1;
}

int getCircleQueque(circleQueque *const cq,int *const num,int index){
    if (index<0||index>=cq->size) {
        return 0;
    }
    *num=cq->data[index];
    return 1;
}

int setCircleQueque(circleQueque *const cq,int num,int index){
    if (index<0||index>=cq->size) {
        return 0;
    }
    cq->data[index]=num;
    return 1;
}

int outCircleQueque(circleQueque *const cq,int *const num){
    if (cq->size==0) {
        return 0;
    }
    *num=cq->data[cq->front++];
    cq->front%=MAX_CYCLEQUEQUE_SIZE;//判断front的位置（front可以循环)
    cq->size--;
    return 1;
}
void printCircleQueque(const circleQueque *const cq){
    printf("循环队列中的数据:\n");
    for (int i=0; i<cq->size; i++) {
        int index=(i+cq->front)%MAX_CYCLEQUEQUE_SIZE;
        printf("第%d个元素是%d\n",i+1,cq->data[index]);
    }
}









