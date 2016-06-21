//
//  main.m
//  随机函数的使用
//
//  Created by 李连宇 on 16/3/21.
//  Copyright © 2016年 itany. All rights reserved.
//

#import <Foundation/Foundation.h>
/*随机方法一：c语言中的随机函数*/
void randTest0()
{
    /*要解决伪随机的问题，可以动态产生随机种子
     time(0)返回值为long,表示从1970.1.1 0:0:0这个时刻到现在所经历的秒数
     */
    srand((unsigned)time(NULL));
    for (int i = 0; i<10; i++) {
        NSLog(@"i=%d",rand()%10);
    }
}
/*随机方法二:oc*/
void test1()
{
        //arc4random();
    for (int i = 0; i<10; i++) {
        NSLog(@"随机数：%d",arc4random()%10);
    }
}
/*随机方法三：推荐，会产生随机数，其中还有个参数x,产生随机的范围是：[0,x)*/
void test2()
{
    for (int i = 0; i<10; i++) {
        NSLog(@"随机数三：%d",arc4random_uniform(1000));
    }
}
int main(int argc, const char * argv[]) {
//    randTest0();
    test2();
    return 0;
}
