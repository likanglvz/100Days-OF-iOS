//
//  Dog.m
//  访问控制修饰符的了解
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Dog.h"
#import "Father.h"
@implementation Dog
/*私有方法*/
-(void)test
{
    Father *f = [Father new];
    f->_x = 100;
//    _x = 300;错误
        //下面错误，y是protected,不能访问
//    f->_y = 200;
}
@end
