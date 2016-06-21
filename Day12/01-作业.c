/*1、ppt的加解密的题目
2、从控制台输入字符串，把小写转换成大写
 */

//宏定义

#include<stdio.h>
#define KEY_CHAR 68
void encodingString(char *str,int len);
int main1(){
    char ch[]="hello";
    int count=sizeof(ch)-1;
    printf("原字符串是：%s\n",ch);
    encodingString(ch,count);
    printf("加密后的字符串是:%s\n",ch);
    encodingString(ch,count);
    printf("解密后的字符串是：%s\n",ch);
    return 0;
}
void encodingString(char *str,int len){
    for (int i=0; i<len-1; i++) {
        if (str[i]==KEY_CHAR) {
            continue;
        }
         str[i]^=KEY_CHAR;
    }
    return;
    
}
void change(char *str);
int main(){
    char ch[]={0};
    change(ch);
    printf("%s\n",ch);
    return 0;
}

void change(char *str){
    printf("请输入一个字符串:");
    int i=0;
    for (; ;i++) {
        char c=getchar();
        if (c!='\n') {
            if (c>='a'&&c<='z') {
                c-=32;
            }
            *(str+i)=c;
        }else{
            break;
        }
    }
    str[i]=0;
}

