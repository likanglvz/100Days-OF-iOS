//
//  Student.m
//  KVC
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Student.h"

@implementation Student
{
    
    int age;
    NSString *name;
    
    NSMutableArray *list;
}

-(instancetype)init{
    self=[super init];
    if (self) {
        list = [NSMutableArray arrayWithObjects:@"路人甲",@"路人乙",@"路人丙",@"路人丁",nil];
        
    }
    
    return self;
}

-(NSUInteger)countOfMgen{
    
    return [list count];
    
    
}

-(id)objectInMgenAtIndex:(NSUInteger)index{
    
    return list[index];
    
}
//制定kvc机制能否访问变量或者属性
//+(BOOL)accessInstanceVariablesDirectly{
//    
//    
//    return NO;
//    
//}
















@end
