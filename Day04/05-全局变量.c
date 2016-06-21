/* 
 全局变量：变量在{}外面
 局部变量：变量定义在{}里面
 全局变量和局部变量同名,全局变量自动隐藏
 全局变量的作用域：从定义的位置开始，一直到文件的结束.作用域
 局部变量的作用域：{}内部从你定义的开始到{}的结束
 
 
 */
#include<stdio.h>
int num=0;//全局变量
int test(){
    printf("num=%d\n",num);
       return 0;
}
int chartest(char c);
int main1(){
    int num=100;//局部变量
    for(;num<105;num++){
        printf("num=%d\n",num);
    }
    printf("num=%d\n",num);
    return 0;
}
int main(){
    char c;
    for (; ;) {
        scanf("%c",&c);
        printf("%d\n",chartest(c));
        if (c=='9') {
            break;
        }
    }
    printf("%d\n",num);
    return 0;
}
int chartest(char c){
    static int num=0;//
    if (c>='A'&&c<='Z') {
        num++;
        return num;
    }
    return 0;
}






