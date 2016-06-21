/*1、编写一个函数，接收2个字符串s和字符串t,把t字符串连接到s字符串的后面，变成一个字符串
 */
#include<stdio.h>
int addString(char a[],char b[]);
int main(){
    char s[]="hello";
    char t[]="world!";
    addString(s,t);
    printf("%s\n",s);
    return 0;
}
int addString(char a[],char b[]){
    int i=0;
    //判断a[i]是否为字符串的尾部
    while (a[i++]!=0);//i是结束符0后面的位置
    i--;
    int j=0;
    while (b[j]!=0) {
        a[i]=b[j];
        i++;
        j++;
    }
    a[i]=0;
    return 0;
}
