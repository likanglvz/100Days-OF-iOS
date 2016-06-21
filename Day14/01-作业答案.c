#include<stdio.h>
#include<string.h>
#include<ctype.h>
int main2(){
  /*  char *str="Welcome";
    printf("%p\n",str);//0x10ccfcf90
    char *first=strchr(str,'e');
    printf("%p\n",first);//0x10ccfcf91

    char *aa=strrchr(str,'e');
    printf("%p\n",aa);//0x10ccfcf96
    printf("%d\n",(int)(aa-first));
   */
 /* char *str="csdabddba";
  char *tar="abd";
    printf("%lu\n",strspn(str,tar));//0
    printf("%lu\n",strcspn(str,tar));//2
  */
    char ch[]="hello";
    printf("%lu,%s\n",strlen(ch),ch);
    memset(ch,0,sizeof(ch));
    printf("%lu,%s\n",strlen(ch),ch);//
    
    int a[]={2,4,6,8};
    for (int i=0; i<4; i++) {
        printf("a[%d]=%d\n",i,a[i]);
    }
    
    memset(a,0,sizeof(a));
    for (int i=0; i<4; i++) {
       printf("a[%d]=%d\n",i,a[i]);
    }//0,0,0,0
    
    char str[]="wewelme";
    memmove(str+2,str,3);
    printf("%s\n",str);//wweelme//wewewme
    return 0;
}


/*
 2、接收用户输入的字符串，判断字符串是否符合如下格式：
 XXX-NN:(X代表大写字母，N代表数字)
 isupper()
 isdigit()
*/
//如果符合要求返回1，否则返回0
int isValid(const char *s);
int main3(){
    char ch[20]={"AB-12"};
    printf("isValid:%d\n",isValid(ch));
    return 0;
}


int isValid(const char *s){
    size_t len=strlen(s);
    if (len!=6) {
        return 0;
    }
    char *p=strchr(s,'-');
   
    if (p-s==len||p-s==0||p-s==len-1||p-s>3||len-(p-s)>3) {
        return 0;
    }
    //是否是大写字母
    for (int i=0; i<p-s; i++) {
        if (!isupper(s[i])) {
            return 0;
        }
    }
    //是否是数字
    for (int j=p-s+1;j<len;j++) {
        if (!isdigit(s[j])) {
            return 0;
        }
    }
    
    return 1;
}

/*1、在忽略大小写的情况下判断2个字符串是否相同*/
int strCmpCase(const char *t,const char *s){
    while (*t && *s && toupper(*t)==toupper(*s)) {
        t++;
        s++;
    }
    return *t-*s;
}
int main(){
    char *s="hello";
    char *t="HELLO";
    if (strCmpCase(s,t)==0) {
        printf("%s和%s是相同的\n",s,t);
    }
    
    
    return 0;
}


int strCmpCase1(const char *t,const char *s){
    int ret=abs(strcmp(t,s));
    //?_______;
}






