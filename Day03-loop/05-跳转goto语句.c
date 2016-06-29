#include<stdio.h>
int main1(){
    int i=0;
    i++;
    goto end;
    printf("i=%d\n",i);
    printf("dfasdf\n");
    end:;
    printf("hello\n");
    return 0;
}

int main(){
    int count=0;//循环多少次找到这个数
    for (int i=40; i<50; i++) {
        for (int j=19; j<100; j+=10) {
            count++;
            int a=i*(j%10)/100;//百位数
            int b=i*j/10%10;
            if (a==4&&b==4) {
                printf("%d*%d=%d\n",i,j,i*j);
                goto end;
            }
        }
    }
end:;
    printf("count=%d\n",count);
    return 0;
}





