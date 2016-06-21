/*
 getchar()他的作用是从stdin流中读入一个字符，如果stdin有数据的话，不用输入他就可以直接读取了，第一次getchar()时，需要人工的输入，但是如果你输入了多个字符，以后getchar()再执行就会直接冲buffor中读取
 
 
 
 
 getchar():输入设备-->buffer(内存缓冲区）-->getchar
 从内存缓冲区中读走一个字符,相当于清除缓冲区一个字符

 */
#include<stdio.h>
int main(){
    char c;
    c=getchar();
//    printf("%c\n",c);
    putchar(c);
    printf("\n");
//    c=getchar();
//     printf("%c\n",c);
    
    
    return 0;
}



