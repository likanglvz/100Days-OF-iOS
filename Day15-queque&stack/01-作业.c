/*A.接受用户输入的字符串，不超过100个字符
 统计其中的字母（分别统计，忽略大小写）、数字、标点符号的数量
 B.定义一个函数，接受一个常量字符指针参数，返回一个整型，用于判断参数所表示的email地址是否合法，如果合法返回1，如果不合法返回以下数字：
 0：email地址为空
 -1：email中没有@
 -2：email中有多个@
 -3：email中@出现在开头
 -4：email中@出现在末尾
 -5：email中没有句点.
 -6：email中.出现在开头
 -7：email中.出现在末尾
 -8：email中.紧跟在@之后
 -9：email中@紧跟在.之后
 -10：email中出现连续2个.
 -11：@之前含有非法的字符（只能有数字、英文字母和下划线以及句点.）*/
#include<stdio.h>
#include<string.h>
#include<ctype.h>
#define NUM 101
int validEmail(const char *email);
int getString(char *ch,int length);
void clearBuffer();
int main(){
    char ch[NUM]={0};
    printf("请输入email的地址：\n");
    int count=getString(ch,NUM-1);
    int ret=validEmail(ch);
    if (ret==1) {
        printf("%s是合法的email地址\n",ch);
    }
    if (count==NUM-1) {
        clearBuffer();
    }
    getString(ch,NUM-1);
    return 0;
}
int validEmail(const char *email){
    size_t len=strlen(email);
    if (len==0) {
        return 0;
    }
    
char *pAt=strchr(email,'@');
    if (pAt==NULL) {
        return -1;
    }
    
         //
    if (pAt!=strrchr(email,'@')) {
        return -2;
    }
    if (pAt==email) {
        return -3;
    }
    if (pAt==email+len-1) {
        return -4;
    }
    char *pDot=strchr(email,'.');
    if(pDot==NULL) {
        return -5;
    }
    if (pDot==email) {
        return -6;
    }
    if (pDot==email+len-1) {
        return -7;
    }
    if (pDot-pAt==1) {
        return -8;
    }
    if (pAt-pDot==1) {
        return -9;
    }
    const char *s=email;//
    for (int i=1; i<len-1; i++) {
        if (s[i]=='.'&&s[i]==s[++i]) {
            return -10;
        }
    }
    
    for (int i=0; i<pAt-email; i++) {
        if (!(isalnum(email[i]))&&email[i]!='_'&&email[i]!='.') {
            return -11;
        }
    }
    return 1;
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







