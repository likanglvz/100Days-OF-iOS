#include<stdio.h>
#define M 2
#define N 3
//v定义求总平均分的函数
void avg(float *p,int cnt);
//定义查找第m个学生的成绩的函数
void search(float (*p)[N],int m);
//定义查找第n门课的总分的函数
void sum(float (*p)[N], int n);
//定义查找所有有不及格成绩的学生成绩函数
void notpass(float **p);
void notpass(float *p[]);
int main(){
    float score[M][N]={0};
    //输入二维数组数据
    for (int i=0; i<M; i++) {
        for (int j=0; j<N; j++) {
            scanf("%f",*(score+i)+j);
        }
    }
    int count=M*N;
    avg(score,count);
    search(score,1);
    sum(score,3);
    //定义指针数组
    float *p[M];
    //指针数组的赋值
    for (int i=0; i<M; i++) {
        p[i]=score[i];
    }
    notpass(p);
    return 0;
}
void avg(float *p,int cnt){
    //所有人的总分数
    float sum=0;
    for (int i=0; i<cnt; i++) {
        sum+=*(p+i);//sum+=p[i]
    }
    printf("avg=%f\n",sum/cnt);
    return ;
}

void search(float (*p)[N],int m){
    if (m>M||m<1) {
        printf("输入有误\n");
        return;
    }
    //获取数组第m行的首地址
    p=p+m-1;
    for (int i=0; i<N; i++) {
        printf("%f ",*(*p+i));
    }
    printf("\n");
}

void sum(float (*p)[N], int n){
    if (n<1||n>N) {
        printf("输入有误\n");
        return;
    }
    float sum=0;
    printf("第%d门课的总分:",n);
    for (int i=0; i<M; i++) {
        sum+=p[i][n-1];
    }
    printf("%f\n",sum);
    return;
}

void notpass(float **p){
    for (int i=0; i<M; i++) {
        for (int j=0; j<N; j++) {
            if (p[i][j]<60) {
                printf("学生%d成绩不及格\n",i+1);
                for(int k=0;k<N;k++){
                    printf("%f ",p[i][k]);
                }
                printf("\n");
                break;
            }
        }
    }
    return;
}

