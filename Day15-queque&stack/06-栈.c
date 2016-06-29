#include<stdio.h>
#define MAX_STACK_SIZE 5
typedef struct{
    int top;
    int data[MAX_STACK_SIZE];
} Stack;

//初始化操作，创建一个空栈
void initStack(Stack *s);
//是否是空栈
int stackEmpty(Stack *s);
//栈是否满
int stackFull(Stack *s);
//压栈
int push(Stack *s,int num);
//出栈
int pop(Stack *s,int *num);
int main(){
    Stack s;
    int flag;
    int num;
    initStack(&s);
    for (int i=1; i<5; i++) {
       flag=push(&s,i);
        if (flag) {
              printf("%d入栈\n",i);
        }else{
            printf("入栈失败\n");
            break;
        }
      
    }
 /*   for (int i=0; i<8; i++) {
        flag=pop(&s,&num);
        if (flag) {
            printf("%d成功出栈\n",num);
        }else{
            printf("出栈失败\n");
            break;
        }
    }
  */
    
    //把栈里元素全部取出来
    while (!stackEmpty(&s)) {
        pop(&s,&num);
        printf("%d出栈\n",num);
    }

    return 0;
}
void initStack(Stack *s){
    s->top=-1;//栈为空
}
//是否是空栈
int stackEmpty(Stack *s){
    if (s->top==-1) {
        return 1;
    }
    return 0;
}
int stackFull(Stack *s){
    if (s->top==MAX_STACK_SIZE-1) {
        return 1;
    }
    return 0;
}
int push(Stack *s,int num){
    if (stackFull(s)) {
        printf("stack is full\n");
        return 0;
    }else{
        s->top++;
        s->data[s->top]=num;
        return 1;
    }
}

int pop(Stack *s,int *num){
    if (stackEmpty(s)) {
        printf("stack empty\n");
        return 0;
    }else{
        *num=s->data[s->top];
        s->top--;
        return 1;
    }
}