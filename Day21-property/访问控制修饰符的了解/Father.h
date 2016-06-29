//
//  Father.h
//  访问控制修饰符的了解
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Father : NSObject
{
        //这种权限可在任何地方通过对象直接访问
    @public
    int _x;
        //在类本身或子类的对象方法中直接访问,默认就是protected
    @protected
    int _y;
        //只能在类本身的实例方法中访问
    @private//
    int _z;
        //是包级访问权限，在一个框架中的类可通过当前father的实例直接访问，比public小一点
    @package
    int _h;
}
@end
