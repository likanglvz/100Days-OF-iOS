//
//  Animal.h
//  类的继承
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    
    int _legNum;
    int _age;
}
-(void)setLegNum:(int)legNum;
-(void)setAge:(int)age;
-(void)say;
-(void)eat;
@end
