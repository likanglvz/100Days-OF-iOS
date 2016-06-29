
/*
#include <stdio.h>
#include <stdlib.h>

int main(void){
    int *p1=malloc(4*sizeof(int));
    int *p2=malloc(sizeof(int[4]));
    int *p3=malloc(4*sizeof*p3);
    int a=1;
    if (p3) {
        for (int n=0; n<4; n++)
              p3[n]=n*n;
            for(int n=0;n<4;++n)
                printf("p3[%d]==%d\n",n,p3[n]);
    }
//    printf("%p\n",p1);
//     printf("%p\n",p2);
//    printf("%p\n",p3);
//    printf("%p",a);
}


#include <stdio.h>
#include <stdlib.h>
int main(){
    void *p=malloc(12);
    int *x=p;
    for (int i=0; i<4; i++) {
        x[i]=i;
    }
    int *q;
    q=realloc(x,3);
    if (q) {
        for (int i=0; i<4; i++) {
            printf("%d\n",*q+i);
    }
    
    }
    
    return 0;
    
}
*/
/*
#include <stdio.h>
int getString(char ch[],int length);
void clearBuffer();
int main(){
    char ch[]={0};
    char ch1[]={0};
    int count=getString(ch, 10);
    printf("%s,%d",ch,count);
    clearBuffer();
    count=getString(ch1, 10);
    printf("%s",ch1);
    return 0;
}
int getString(char ch[],int length){
    int i=0;
    
    for (; i<length; i++) {
        ch[i]=getchar();
        if(ch[i]=='\n'){
            break;
        }
        
    }
    ch[i]=0;
    return i;
}
void clearBuffer(){
    char cb;
    while ((cb=getchar())!='\n');
    return;
    
}
//void clearBuffer(){
//        char cb;
//    while (1){
//        cb=;
//    }
//
//}
*/
#include <stdio.h>
#include <string.h>
int char_contair(char *str,char c);
int main(){
    char *str="helcoworld";
    int a=char_contair(str,'a');
    printf("%d",a);
    return 0;
}
int char_contair(char *str,char c){
    int n=strlen(str);
    for (int i=0; i<n; i++) {
        if (str[i]==c) {
            return 1;
        }
        
    }
    return 0;
}















