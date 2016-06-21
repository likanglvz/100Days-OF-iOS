//
//  Dog.m
//  类的继承
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)setTail:(int)tail
{
    _tail = tail;
}

-(int)tail
{
    return _tail;
}
/*子类特有的方法*/
-(void)eat
{
    /*如果父类的成员变量是私有，则子类不可以访问*/
    NSLog(@"legNum=%d,我喜欢吃棒棒糖",_legNum);
    /*注意：下面两行错误，因为_age是私有的，这种访问叫Animal类的外部访问其私有成员变量，所以错误
    Animal *a = [Animal new];
    NSLog(@"%d",a->_age);
     */
}
/*重点，难点：方法的重写，也可叫方法覆盖：子类中的方法与父类中的某一方法具有相同的方法名，返回类型，方法参数都相同*/
-(void)say
{
    NSLog(@"我是子类中重写父类的say方法，legNum=%d,tail=%d个",_legNum,_tail);
//    [self say];递归
//    [super say];调用父类的say
}
@end
