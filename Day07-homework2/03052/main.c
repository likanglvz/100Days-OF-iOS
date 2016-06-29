//#include <stdio.h>

//int main() {
//    int a[3][3]={1,2,3,1,2,3,1,2,3};
//    int b[3][3]={1,2,3,1,2,3,1,2,3};
//

//int main() {
//
//    int a[3]={1,2,3};
//    int b[3]={1,2,3};
//    for (int j=0; j<3; j++) {
//        int sum=0;
//        for (int i=0; i<3; i++) {
//            sum+=a[i]*b[j];
//        }
//        printf("%d  ",sum);
//
//    }
//    return 0;
//}

//2、计算2个3*3的行列式的乘法结果。
//行列式乘法规则：
//行列式A：								行列式B：
//a11   a12   a13						b11   b12   b13
//a21   a22   a23						b21   b22   b23
//a31   a32   a33						b31   b32   b33
//A*B的结果是：
//a11*b11+a12*b21+a13*b31  a11*b12+a12*b22+a13*b32  a11*b13+a12*b23+a13*b33
//a21*b11+a22*b21+a23*b31  a21*b12+a22*b22+a23*b32  a21*b13+a22*b23+a23*b33
//a31*b11+a32*b21+a33*b31  a31*b12+a32*b22+a33*b32  a31*b13+a32*b23+a33*b33
//
#include<stdio.h>
int main(){
    int a[3][3]={1,2,3,4,5,6,7,8,9};
    int b[3][3]={1,2,3,4,5,6,7,8,9};
    for (int j=0; j<3; j++) {
    
        for (int i=0; i<3; i++) {
            int sum=0;
            for (int k=0; k<3; k++) {
                sum+=a[j][k]*b[k][i];
            }
            printf("%d  ",sum);
        }
        printf("\n");
        
    }
    return 0;
}








