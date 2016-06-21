/*

#include <stdio.h>
#define MAX_QUEUE_SIZE 30
typedef  struct{
    int size;
    int data[MAX_QUEUE_SIZE];
}Queque;
//入队
int inQueque(Queque *s,int num);
//获取队列中数据
int getQueque(Queque * const s,int * const num,int index);

int outQueque(Queque * const s,int *const num);
int setQueque(Queque * const s,int * const num,int index);
void printQueque(const Queque * const s);
int main() {
    int flag;
    int num;
    Queque qq= {0,0};
    for (int i=0; i<4; i++) {
       flag=inQueque(&qq,i*10);
        if (flag) {
            printf("成功入会\n");
        }else{
            printf("您的会费不足，请交纳足够会费\n");
            break;
        }
    }
    printQueque(&qq);
    flag=getQueque(&qq,&num,2);
    printf("num=%d\n",num);
    outQueque(&qq,&num);
    printQueque(&qq);
   
    
    
    return 0;
}
int inQueque(Queque *s,int num){
    if (s->size==MAX_QUEUE_SIZE) {
        return 0;
    }
    s->data[s->size++]=num;
    return 1;
}
int getQueque(Queque * const s,int * const num,int index){
    if (index>=s->size||index<0) {
        return 0;
    }
    *num=s->data[index];
    return 1;
}
int outQueque(Queque * const s,int *const num){
    if (s->size==0) {
        return 0;
    }
    *num=s->data[0];
    int i=0;
    while(i<s->size)
    s->data[i]=s->data[i+1];
    i++;s->size--;
    return 1;
}
void printQueque(const Queque * const s){
    for (int i=0; i<s->size; i++) {
        printf("第%d个元素是%d\n",i+1,s->data[i]);
    }
}
int setQueque(Queque * const s,int * const n,int index){
    if (index>=s->size||index<0) {
        return 0;
    }
    s->data[index]=*n;
     return 1;
}






*/





#include<stdio.h>
#define MAX_QUEUE_SIZE 10
typedef  struct{
    int size;
    int front;
    int rear;
    int data[MAX_QUEUE_SIZE];
}CircleQueque;

int inCircleQueque(CircleQueque *const cq,int num);
int getCircleQueque(CircleQueque *const cq,int *const num,int index);
int setCircleQueque(CircleQueque *const cq,int  num,int index);
int outCircleQueque(CircleQueque *const cq,int *const num);
void printQueque(const CircleQueque * const cq);
int main(){
    CircleQueque qq={0,0,0,0};
    for (int i=0; i<13; i++) {
        int flag=inCircleQueque(&qq,i*5);
        if (flag) {
            printf("成功入会\n");
        }else{
            printf("您的会费不足，请交纳足够会费\n");
            break;
        }
    }
    printQueque(&qq);

    
    return 0;
}
int inCircleQueque(CircleQueque *const cq,int num){
    if (cq->size==MAX_QUEUE_SIZE) {
        return 0;
    }cq->data[cq->rear++]=num;
    cq->rear%=MAX_QUEUE_SIZE;
    cq->size++;
    return 1;
    
}
int getCircleQueque(CircleQueque *const cq,int *const num,int index){
    if (index<0||index>=cq->size) {
        return 0;
    }
    *num=cq->data[index];
    return 1;
}
int setCircleQueque(CircleQueque *const cq,int num,int index){
    if (index>=cq->size||index<0) {
        return 0;
    }
    cq->data[index]=num;
    return 1;
}
int outCircleQueque(CircleQueque *const cq,int *const num){
    if (cq->size==0) {
        return 0;
    }
    *num=cq->data[cq->front];
    cq->front%=MAX_QUEUE_SIZE;
    cq->size--;
    return 1;
}
void printQueque(const CircleQueque * const cq){
    for (int i=0; i<cq->size; i++) {
        int index=(i+cq->front)%MAX_QUEUE_SIZE;
        printf("%d\n",cq->data[index]);
    }
}





/*
#include <stdio.h>
#define MAX_STACK_SIZE 6
typedef struct{
    int top;
    int data[MAX_STACK_SIZE];
}Stack;
void initStack(Stack *s);
int stackEmpty(Stack *s);
int stackFull(Stack *s);
int push(Stack *s,int num);
int pop(Stack *s,int *num);
void printStack(const Stack * const s);

int main(){
    Stack s;
    initStack(&s);
    for (int i=0; i<5; i++) {
        push(&s,i*2);
    }
    printStack(&s);
    
    return 0;
}

void initStack(Stack *s){
    s->top=-1;
}
int stackEmpty(Stack *s){
    if (s->top<0) {
        return 1;;
    }
    return 0;
}
int stackFull(Stack *s){
    if (s->top==MAX_STACK_SIZE-1) {
        return 1;
    }return 0;
}
int push(Stack *s,int num){
    if (stackFull(s)) {
        printf("栈已满\n");
    }else
        s->data[s->top]=num;
    s->top++;
    return 0;
}
int pop(Stack *s,int *num){
    if (stackEmpty(s)) {
        printf("栈为空\n");
    }else
    *num= s->data[s->top];
    s->top--;
    return 0;
    
    
}

void printStack(const Stack * const s){
    for (int i=0; i<s->top; i++) {
        printf("%d\n",s->data[i]);
    }
}


*/











