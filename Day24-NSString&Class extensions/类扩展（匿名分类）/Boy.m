//
//  Boy.m
//  类扩展（匿名分类）
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Boy.h"
@interface Boy ()
{
@public
    int _age;
}
-(void)test1;
@property (readwrite)int weight;
@end
@implementation Boy
-(void)test1
{
    NSLog(@"fjdkal;fdjkls");
}
-(void)show
{
    _girlNum = 23;
        //错误，没提供set方法
//    self.girlNum = 23;
    NSLog(@"女朋友数量：%d",self->_girlNum);
    self.weight = 120;
    _age = 3;
}
@end
