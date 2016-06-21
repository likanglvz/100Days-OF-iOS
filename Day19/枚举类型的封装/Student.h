//
//  Student.h
//  枚举类型的封装
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    Boy,//代表男生
    Girl//女生
}Sex;
@interface Student : NSObject
{
    float _score;
    Sex _sex;
}
-(void)setScore:(float)score;
-(float)score;

-(void)setSex:(Sex)sex;
-(Sex)sex;
@end
