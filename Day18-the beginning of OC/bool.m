#import <Foundation/foundation.h>

BOOL isDifferent(int a,int b){
    return (a-b);
}
int main()
{
    int a = -12;
    BOOL b = YES;//bool型变量的值只有两个NO和YES
    if(a){
        NSLog(@"条件值为%d",b);
    }else{
        NSLog (@"条件为假，b=%i",b);
    }
    
    if (isDifferent(45,23)==YES) {
        NSLog(@"xxxxx");
    }
    
    return 0;
}
