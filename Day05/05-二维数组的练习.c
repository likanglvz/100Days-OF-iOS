#include<stdio.h>
int main(){
    int a[3][4]={0};
    int sum=0;
    int sumPerson[3]={0},sumCourse[4]={0};
    //从控制台输入值
    for (int i=0; i<3; i++) {
        for (int j=0; j<4; j++) {
            printf("请输入a[%d][%d]的值:",i,j);
            scanf("%d",&a[i][j]);
        }
    }
    //求和
    for (int i=0; i<3; i++) {
        for (int j=0; j<4; j++) {
            sum+=a[i][j];
            sumPerson[i]+=a[i][j];
            sumCourse[j]+=a[i][j];
        }
    }
    printf("本班的均分是:%lf\n",(double)sum/12);
    for (int i=0; i<3; i++) {
        printf("第%d个人的均分是:%lf\n",i+1,(double)sumPerson[i]/4);
    }
    for (int j=0; j<4; j++) {
        printf("第%d门课的均分是:%lf\n",j+1,(double)sumCourse[j]/3);
    }
    
    return 0;
}