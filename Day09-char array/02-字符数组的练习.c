/*
编写一个函数，如果字符串中含有字符一个字符，返回1，否则返回0
*/
#include<stdio.h>
int char_contains(char str[],char c);
int main1(){
    char a[]="hello world!";
    char b='a';
    int flag;
    flag=char_contains(a,b);
    if (flag) {
        printf("%c在%s的存在\n",b,a);
    }else
    {
        printf("%c不在%s中\n",b,a);
    }
    return 0;
}

int char_contains(char str[],char c){
    //遍历整个字符串
    int i=-1;
    while (str[++i]!=c && str[i]!=0); //{
//        if (str[i]==c) {
//            return 1;
//        }
  //  }
   // return str[i]!='\0';
    return str[i]=='\0'?0:1;
    
}
/*写一个函数，判断字符串是否是回文：从左往右和从右往左读是一样的,是回文：返回1，不是回文返回08
 */
int isHuiWen(char str[],int length);
int main(){
    char a[]="abeba";
    int count=sizeof(a)-1;
    printf("count=%d\n",count);//7
    int flag=isHuiWen(a,count);
    if (flag) {
        printf("%s是回文\n",a);
    }else{
        printf("%s不是回文\n",a);
    }
    return 0;
}
int isHuiWen(char str[],int length){
    int i=0;
    int j=length-1;
    while (i<length/2) {
        if (str[i++]!=str[j--]) {
            return 0;
        }
    }
    return 1;

}

 
 
 
 
 
 
 
 
 

