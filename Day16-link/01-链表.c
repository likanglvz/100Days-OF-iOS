#include<stdio.h>
#include<stdlib.h>
//C语言中唯一的一个先使用后定义的
typedef struct _Node{
    int  data;
    struct _Node *next;
} Node;

//插入结点
void insert(Node *head,Node *pNew,int index);
void insert1(Node **head,int num,int index);
void print(Node *head);
//创建有n个结点的链表，返回head
Node *createLink(int n);
//删除链表中的结点,删除成功返回1，删除失败返回0
int removeNode(Node **head,int index,int *num);
//获取链表中index中的数据，如果获取成功返回1，否则返回0
int getData(Node **head,int index,int *num);

int main1(){
    Node *head=NULL;
    int num;
    for (int i=0; i<3; i++) {
        insert1(&head,i*2,i-1);
    }
    print(head);
    return 0;
}

int main(){
    int num;
    Node *head=createLink(4);
    print(head);
    removeNode(&head,2,&num);
    printf("num=%d\n",num);
    printf("----\n");
    print(head);
    getData(&head,2,&num);
    printf("num=%d\n",num);
    return 0;
}
void insert(Node *head,Node *pNew,int index){
    Node *p=head;
    for (int i=0; i<index && p!=NULL; i++) {
        p=p->next;
    }
    if (p==NULL) {//结点不存在
        printf("要插入的结点不存在\n");
        return;
    }
    pNew->next=p->next;//要插入的pNew的结点的指针域指向第index个结点的后续的结点
    p->next=pNew;//第index个结点的指针域指向插入的pNew的结点
}

void insert1(Node **head,int num,int index){
    //开辟一个空间来存结点，并初始化
    Node *pNew=(Node *)malloc(sizeof(Node));
    pNew->data=num;
    pNew->next=NULL;
    if (*head==NULL) {//空表
        *head=pNew;
    }else{
        //遍历的指针
       Node *p=*head;
       for (int i=0; i<index &&p!=NULL; i++) {
        p=p->next;
            }
        if (p==NULL) {
            printf("error\n");
            return;
        }

    pNew->next=p->next;
    p->next=pNew;
    }
}
void print(Node *head){
    Node *p=head;
    if (p==NULL) {
        printf("empty\n");
        return;
    }
   while (p!=NULL) {
       printf("%d\n",p->data);
       p=p->next;
    }
}
Node *createLink(int n){
    Node *head=NULL;//空链表
    int num;
    printf("请输入数据:\n");
    for (int i=0; i<n; i++) {
        scanf("%d",&num);
        insert1(&head,num,i-1);
    }
    return head;
}
int removeNode(Node **head,int index,int *num){
    //index越界，链表为空
    if (index<0||*head==NULL) {
        return 0;
    }
    Node *pre=*head;
    Node *p=pre;
    for (int i=0; i<index; i++) {
        pre=p;
        p=p->next;
    }
    if (p==NULL) {
        return 0;
    }
    //删除第一个结点
    if (pre==p) {
        *head=p->next;
    }else{
           nt;
        
    }
    p->next=NULL;
    *num=p->data;
    free(p);
    return 1;
}

int getData(Node **head,int index,int *num){
    Node *p=*head;
    if (index<0||*head==NULL) {
        return 0;
    }
    for (int i=0; i<index; i++) {
        p=p->next;
        if (p==NULL) {
            return 0;
        }
    }
    *num=p->data;
    return 1;
}




