/*1、求[1，1000]之间既不能被7整除也不能被5整除的整数之和，将结果存入变量s中。
 2、求[m,n]之间所有整数的和，m、n由用户输入，如果用户输入的m小于n则直接计算，如果m大于n则交换后再计算，如果相等则给出提示不计算。如：用户输入m=12，n=3，则和= 3+4+5+ …… +11 + 12
 3、打印出所有的 "水仙花数 "，所谓 "水仙花数 "是指一个三位数，其各位数字立方和等于该数本身。例如：153是一个 "水仙花数 "，因为153=1的三次方＋5的三次方＋3的三次方。
 4、有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？=
 5、使用函数的递归，求出n的累加和
 sum=1+2+3....+n

*/
#include<stdio.h>
void test();//函数的声明
void changeSum(int m,int n);
void narcisis();
void repeatNum();
int sum(int n);
int calTari(int row,int col);
int main(){
//    int m,n;
//    scanf("%d,%d",&m,&n);
//    test();
//    changeSum(m,n);
//    narcisis();
//    repeatNum();
//  printf("%d\n",sum(100));
    //打印杨辉三角的行数的值
    int maxRow;
    scanf("%d",&maxRow);
    for (int row=0 ; row<=maxRow; row++) {//杨辉三角的行数
        for (int k=maxRow-row; k>0; k--) {//打印空格
            printf(" ");
        }
        for (int col=0; col<=row; col++) {//打印杨辉三角的数字
            printf("%d ",calTari(row,col));
        }
        printf("\n");
    }

    return 0;
}

void test(){
    int sum=0;
    for (int i=1; i<=1000; i++) {
        if (i%7!=0 && i%5!=0) {
            sum+=i;
        }
    }
    printf("sum=%d\n",sum);
    return;
}
void changeSum(int m,int n){
    int sum=0;
    if (m==n) {
        printf("程序over\n");
        return;
    }else{
        if (m>n) {
            m=m^n;
            n=m^n;
            m=m^n;
        }
        for (int i=m; i<=n; i++) {
            sum+=i;
        }
        printf("sum=%d\n",sum);
    }
    return;
}
void narcisis(){
    for (int i=100; i<1000; i++) {
        int x=i%10;//个位数
        int y=i/10%10;//十位数
        int z=i/100;//百位数
        if (i==(x*x*x+y*y*y+z*z*z)) {
            printf("%d\n",i);
        }
    }
    return ;
}

void repeatNum(){
    int count;//统计无重复的不相同的数字
    
    for (int i=1; i<5; i++) {
        for (int j=1; j<5; j++) {
            for (int k=1; k<5; k++) {
                if (i!=j&&i!=k&&j!=k) {
                    printf("%d%d%d ",i,j,k);
                    count++;
                    if (count%4==0) {
                        printf("\n");
                    }
                }
            }
        }
    }
    
    
    return;
}
int sum(int n){
    if (n==1) {
        return 1;
    }
    return n+sum(n-1);
}
//row是行，col每行杨辉三角数的个数
int calTari(int row,int col){
    if (row==col||col==0) {   //row从0开始，col从0开始
        return 1;
    }
    
    return calTari(row-1,col-1)+calTari(row-1,col);
}




