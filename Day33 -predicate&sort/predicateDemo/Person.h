//
//  Person.h
//  predicateDemo
//
//  Created by AppleUser on 16/4/9.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong)NSString *firstName;
@property(strong)NSString *lastName;
@property(assign)int age;


-(id)initWithFirstName:(NSString *)fName lastName :(NSString *)lName andAge:(int)a;


-(void)description;
@end
