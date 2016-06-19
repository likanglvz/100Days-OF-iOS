//
//  Easonsong.m
//  homework
//
//  Created by 李康 on 16/5/11.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Easonsong.h"

@implementation Easonsong
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    //编码各个属性
    [aCoder encodeObject:self.song1 forKey:@"song1"];
    [aCoder encodeObject:self.song2 forKey:@"song2"];
    [aCoder encodeObject:self.song3 forKey:@"song3"];
    [aCoder encodeObject:self.song4 forKey:@"song4"];
    
    
    
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.song1 = [aDecoder decodeObjectForKey:@"song1"]; // 解码出self.age;
        self.song2 = [aDecoder decodeObjectForKey:@"song2"];
        self.song3 = [aDecoder decodeObjectForKey:@"song3"];
        self.song4 = [aDecoder decodeObjectForKey:@"song4"];
        
    }
    
    
    return self;
    
    
}

@end
