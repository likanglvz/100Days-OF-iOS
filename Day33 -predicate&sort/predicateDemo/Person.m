//
//  Person.m
//  predicateDemo
//
//  Created by AppleUser on 16/4/9.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithFirstName:(NSString *)fName lastName :(NSString *)lName andAge:(int)a{
    self=[super init];
    if (self) {
        self.firstName=fName;
        self.lastName=lName;
        self.age=a;
    }
    return self;
}


-(void)description{
    
    NSLog(@"名字是%@ %@,age是%d",self.firstName,self.lastName,self.age);
    
}
@end
