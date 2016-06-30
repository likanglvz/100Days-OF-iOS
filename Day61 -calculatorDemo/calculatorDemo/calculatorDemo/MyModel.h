//
//  MyModel.h
//  calculatorDemo
//
//  Created by baiheng on 16/5/6.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject
{
    double accumulator;//累加器
    double opr;//操作数
    char op;//操作
}


-(void)setModel:(char)c;
-(NSString *)getModel;



@end
