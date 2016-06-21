//
//  main.m
//  第一个oc代码－面向对象
//
//  Created by 李康 on 16/3/17.
//  Copyright © 2016年 李康 All rights reserved.
//

#import <Foundation/Foundation.h>
/*interface 开头的是用来声明一个类，
 在这里，只可以作两件事
 1.定义成员变量
 2.声明方法
 */
@interface Animal :NSObject
{
        //定义类的成员变量
    @public
    int _legNum;
    char * _name;
}
    //void eat();函数声明
    //声明当前这个类可以实现些什么功能
-(void)eat;
    //如果方法有参数，则方法的":"也是方法名的一部分
-(void)setLegNum:(int)legNum andName:(char *)name;

-(void)show;
@end

@implementation Animal
-(void)eat
{
    NSLog(@"我喜欢吃鱼");
    NSLog(@"在eat方法中，我有%d条腿",_legNum);
}
-(void)setLegNum:(int)legNum andName:(char *)name
{
    _legNum = legNum;
    NSLog(@"我有%d条腿",_legNum);
}
-(void)show
{
    NSLog(@"leg=%d,name=%s",_legNum,_name);
}
@end


int main(int argc, const char * argv[]) {
    Animal *a = [Animal new];
    [a eat];
    
    [a setLegNum:4 andName:"abcddd"];
    
    a->_legNum = 100;
    a->_name = "abc";
    [a eat];
    
    Animal * a1 = [Animal new];
    [a1 eat];
    
    [a show];
    
    [a1 show];
    return 0;
}
