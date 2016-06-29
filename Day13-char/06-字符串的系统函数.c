#include<stdio.h>
#include<string.h>

/*strlen:计算的是字符数，不是字数。一个汉字算3个字符
   strcpy
   strncpy
 
 
 */
int main1(){
   char *s="helloworld";
    int count;
    count=strlen(s);
    printf("count=%d\n",count);
    return 0;
}

int main2(){
    char *s="helloworld";
    char ch[30]={0};
    char ch1[30]={0};
    strcpy(ch,s);
    strncpy(ch1,s,5);
    puts(ch);
    puts(ch1);
    return 0;
}
//编写一个函数char_contains(char *str,char c).
//如果字符串str中包含字符c则返回数值1，否则返回0
int char_contains(char *str,char c){
    //遍历整个字符串
    for (int i=0; i<strlen(str); i++) {
        //如果发现某个字符和c相同，直接返回1并退出函数
        if (str[i]==c) {
            return 1;
        }
    }
    
    
    return 0;
    
}

int  main(){
     char *s="helloworld";
     char a='l';
    if (char_contains(s,a)) {
        printf("在%s中出现%c\n",s,a);
    }else{
        printf("在%s中没有发现%c\n",s,a);

    }
    
    
    
    return 0;
}

