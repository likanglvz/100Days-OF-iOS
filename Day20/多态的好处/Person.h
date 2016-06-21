//
//  Person.h
//  多态的好处
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    NSString *_name;
}
-(void)setAge:(int)age;
-(int)age;

-(void)setName:(NSString*)name;
-(NSString*)name;
-(void)say;
@end
