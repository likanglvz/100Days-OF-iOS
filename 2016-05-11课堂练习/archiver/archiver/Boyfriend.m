//
//  BoyFriend.m
//  archiver
//
//  Created by 李康 on 16/5/11.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "BoyFriend.h"

@implementation BoyFriend

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    //编码各个属性
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeFloat:self.height forKey:@"height"];
    
    
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.age = [aDecoder decodeIntForKey:@"age"]; // 解码出self.age;
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.height = [aDecoder decodeFloatForKey:@"height"];

    }
  
    
    return self;
    
    
}

-(NSString *)description{

    return [NSString stringWithFormat:@"姓名%@,年龄:%d,身高:%f",self.name,self.age,self.height];

}




@end
