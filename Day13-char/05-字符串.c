#include<stdio.h>


//获取字符串，返回值：获取的字符的个数

int getString(char *ch,int length);
//清除用户输入的多余数据
void clearBuffer();
int main(){
    
    char ch[20]={0};
    char ch1[20]={0};
//    scanf("%19c",ch);
//    scanf("%s",ch);
//    gets(ch);
    int count;
    count=getString(ch,10);
    printf("%s,%d\n",ch,count);
    clearBuffer();
    count=getString(ch1,15);
    printf("%s\n",ch1);
    return 0;
}

int getString(char *ch,int length){
    //循环的次数，输入字符的个数
    int i=0;
    while (i<length) {
        char c=getchar();
        if (c!='\n') {
            ch[i++]=c;
        }else{
            break;
        }
    }
    ch[i]=0;
    return i;
}

void clearBuffer(){
    char ch;
    while ((ch=getchar())!='\n');
    return;
}

