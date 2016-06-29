//
//  Cat.h
//  属性的使用
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cat : NSObject
/*atomic:原子的，在多线程中，对该成员变量的访问会加锁，优点是数据安全，缺点是效率低，一个属性默认都是atomic
 nonatomic:非原子的，在多线程中，要同时对该成员变量访问，优点是效率高，缺点是数据不安全
 */
/*不可以同时实现set和get方法*/
@property (nonatomic)int  age;
-(void)test;

@end
