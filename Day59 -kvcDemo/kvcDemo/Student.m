//
//  Student.m
//  kvcDemo
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "Student.h"

@implementation Student
{
    int age;
    NSString * name;
    
    
    NSMutableArray * list ;
    
    
    
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        list = [NSMutableArray arrayWithObjects:@"西施",@"玉环",@"昭君",@"貂蝉", nil];
        
    }
    return self;
    
}

-(NSUInteger) countOfMgen
{
    return 3;//[list count];
    
}

-(id)objectInMgenAtIndex:(NSUInteger)index
{
    
    switch (index) {
        case 0:
            return @"aa";
        case 1:
            return @"bb";
    
            break;
            
        default:
            return @"cc";
            
            break;
    }
    //return [list objectAtIndex:index];
    
}

//指定kvc机制能否访问变量或属性
+(BOOL)accessInstanceVariablesDirectly
{
    return NO;
    
}




@end
