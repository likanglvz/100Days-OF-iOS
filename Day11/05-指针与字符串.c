/*
 必须掌握：
 定义字符串的方式：
 1、利用字符数组
      char  a[]="hello";
     特点：字符串里面的字符是可以修改的
     使用场合：字符串的内容是需要修改的
 2、利用指针
  char *b="hello"
      特点：字符串里面的字符是不可以修改的
      使用场合：字符串的内容不需要修改的，但是要经常使用的
 
 常量区：存放的是常量的字符串
 栈：所有的局部变量以及递归的结果
 堆：对象
 
 */



#include<stdio.h>
int main(){
    char name[]="chenxp";//'c'+'h'+'e'+'n'+'x'+‘p'+0
    char name11[]="chenxp";
    char *name1="chenxp";//指针变量name1指向了字符串的首字母
    printf("%c\n",*name1);
    printf("%s\n",name1);
    char *name2="chenxp";
    char *name3="chenxp";
    //name1和name2以及name3的存的地址是一样的，说明他们是同一个字符串，说明不会再开辟空间来存储了
    //用指针定义的字符串存放在常量区域，缓存起来
    printf("name1=%p\n",name1);
    printf("name2=%p\n",name2);
    *(name1+1)='u';
    printf("%c\n",*(name1+1));

    return 0;
}
int main2(){
    char c[]="hello";
    char *t="hello";
    char *p=c;
    
    printf("%c,%c,%c\n",c[1],p[1],t[1]);
    
    printf("%c,%c,%c\n",*(c+1),*(p+1),*(t+1));
    printf("%c,%c\n",*(++p),*(++t));//e,e
    *(c+1)='X';
    *(p+1)='X';
    //*(t+1)='X';错误的
    
    
    
    return 0;
}


//定义一个函数，复制字符串

void copystring(char *str,char arr[]);
//void copystring(char *str,char *arr);

int main3(){
    char a[]="sdsdgsgdf";
    char *t="hello";
    copystring(t,a);
    printf("%s\n",a);
    
    
    return 0;
}
void copystring(char *str,char arr[]){
    for (; *str!=0;str++,arr++) {
        *arr=*str;
    }
    *arr=0;
    
    return;
}
int isHuiWen(char *s);
int main5(){
    char *s="abbba";
    if (isHuiWen(s)) {
        printf("%s是回文\n",s);
    }else{
        printf("%s不是回文\n",s);
    }
    
    return 0;
}
int isHuiWen(char *s){
    char *left=s;
    char *right=s;
    while(*right!=0){
        right++;
    }
    right--;
    while (left<right) {
        if (*left++!=*right--) {
            return 0;
        }
    }
    return 1;
}

void strlink(char *s,char *t);
int main6(){
    char s[]="hello";
    char *t="world";
    
    strlink(s,t);
    printf("%s\n",s);
    return 0;
}
void strlink(char *s,char *t){
//    while (*s!=0) {
//        s++;
//    }
    while (*s++);
    s--;
    
//    while (*t!=0) {
//        *s=*t;
//        s++;
//        t++;
//    }
//    *s=0;
    while((*s++=*t++));
    return;
}




