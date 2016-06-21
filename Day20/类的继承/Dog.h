//
//  Dog.h
//  类的继承
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Animal.h"

@interface Dog : Animal
{
    /*父类有的成员变量，子类不可以再定义*/
    int _tail;
}
-(void)setTail:(int)tail;
-(int)tail;
-(void)eat;
/*方法的重写*/
-(void)say;
@end
