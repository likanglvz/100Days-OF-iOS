#include<stdio.h>
#include<stdlib.h>
typedef struct _Node{
    int data;
    struct _Node *next;
}Node;

void insert(Node *head,Node *pNew,int index);
void insert1(Node **head,int num,int index);
Node *createLink(int n);
void print(Node *head);
int removeNode(Node **head,int index,int *num);
int getData(Node **head,int index,int *num);


int main1(){
    Node *head=NULL;
//    Node s;
//    Node *p;
//    p=&s;
  // int num;
//    scanf("%d",&num);
//    p->data=num;
//    p->next=NULL;
//    head=p;
    for (int i=0; i<3; i++) {
        insert1(&head, i*2, i-1);
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
    if (p==NULL) {
        printf("要插入的结点不存在\n");
        return;
    }
    pNew->next=p->next;
    p->next=pNew;
}

void insert1(Node **head,int num,int index){
    
    Node *p=*head;
    Node *q=(Node*)malloc(sizeof(Node));
    q->data=num;
    q->next=NULL;
    if (*head==NULL) {
        *head=q;
    }else{
    for (int i=0; i<index && p!=NULL; i++) {
        p=p->next;
    }
    if (p==NULL) {
        printf("要插入的结点不存在\n");
        return;
    }
    q->next=p->next;
    p->next=q;
    
        
        }
  
}
void print(Node *head){
    Node *p=head;
        while (p!=NULL) {
            printf("%d\n",p->data);
            p=p->next;
        }
}

Node *createLink(int n){
    Node *head=NULL;
    int num;
    printf("请输入数据:\n");
    for (int i=0; i<n; i++) {
        scanf("%d",&num);
        insert1(&head, num, i-1);
    }
    return head;
}

int removeNode(Node **head,int index,int *num){
    Node *p=*head;
    Node *pre=p->next;
    
    if (index<0) {
        return 0;
    }
    if (head==NULL) {
        printf("链表为空，无法删除");
        return 0;
    }
    if (index==1) {
        *p=*pre;
        free(pre);
    }else{
        for (int i=0; i<index-1 && p!=NULL; i++) {
            p=p->next;
        }if (p==NULL) {
            printf("要删除的结点不存在\n");
            return 0;
        }
        *pre=*p->next;
        *num=pre->data;
        p->next=pre->next;
        free(pre);
    }
    return 1;
}

int getData(Node **head,int index,int *num){
    Node *p=*head;
    if (index<0) {
        return 0;
    }
    if (head==NULL) {
        printf("链表为空，无法删除");
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



















    
