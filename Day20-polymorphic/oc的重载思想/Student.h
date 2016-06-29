//
//  Student.h
//  oc的重载思想
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _age;
    NSString *_name;
}
-(void)setAge;
-(void)setAge:(int)age andWithName:(NSString*)name;
-(void)setAge:(int)age;

@end
