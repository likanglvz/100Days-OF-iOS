//
//  BoyFriend-XHQ.m
//  0511单视图
//
//  Created by AppleUser on 16/5/11.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "BoyFriend-XHQ.h"

@implementation BoyFriend_XHQ

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)encodeWithCoder:(NSCoder *)aCoder
{//必须事项的方法之一，编码器
       [super encodeWithCoder:aCoder];
       //编码各个属性
       [aCoder encodeInt:self.age forKey:@"age"];
       [aCoder encodeObject:self.name forKey:@"name"];
       [aCoder encodeFloat:self.height forKey:@"height"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{//必须实现的方法之一，解码
       self = [super initWithCoder:aDecoder];
       //解码
       self.age = [aDecoder decodeIntForKey:@"age"];
       self.name = [aDecoder decodeObjectForKey:@"name"];
       self.height = [aDecoder decodeFloatForKey:@"height"];
       return self;
}
-(NSString * )description
{
       return [NSString stringWithFormat:@"姓名：%@，年龄：%d,身高：%f",self.name,self.age,self.height];
}



@end
