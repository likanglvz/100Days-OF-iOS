//
//  main.m
//  demo2
//
//  Created by 李康 on 16/3/17.
//  Copyright © 2016年 李康. All rights reserved.
//
/*对象作为参数传递给函数的用法
 NS表示的是next step的缩写
 */
#import <Foundation/Foundation.h>
@interface Stu : NSObject
{
    @public
   int _age;
    
}
-(void)say;

@end

void test()
{
    
}
@implementation Stu

-(void)say
{
    NSLog(@"我的年龄为%d",_age);
}

@end
/*不能成功修改对象的成员值*/
void show1(int age)
{
    NSLog(@"show1函数中被传进来的值age=%d",age);
    age = 20;
}
/*可以成功修改*/
void show2(Stu *s)
{
    s->_age = 20;
}

void show3(Stu *xx)
{
    Stu *tmp = [Stu new];
    tmp->_age = 18;
    xx=tmp;
    xx->_age = 28;
}
int main(int argc, const char * argv[]) {
    
    Stu *s = [Stu new];
    s->_age = 6;
    
//    show1(s->_age);
//    show2(s);
    show3(s);
    [s say];
    
    
    return 0;
}
