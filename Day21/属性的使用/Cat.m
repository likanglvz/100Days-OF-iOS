//
//  Cat.m
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Cat.h"

@implementation Cat
/*一旦手动实现了set或get方法，则自动产生的该方法就会消失*/
-(void)setAge:(int)age
{
    if (age<=0||age>=100) {
        _age = 1;
        NSLog(@"执行的是人工产生的set方法");
        return;
    }
    _age = age;
}
//-(int)age
//{
//    return _age;
//}
-(void)test
{
    NSLog(@"age=%d",_age);
}
@end
