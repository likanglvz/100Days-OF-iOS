//
//  Student.m
//  0505第二个KVC
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "Student.h"

@implementation Student
{
       int age;
       NSString * name;
       NSMutableArray * list;
       
}
-(instancetype)init
{
       self = [super init];
       if (self) {
              list = [NSMutableArray arrayWithObjects:@"西施",@"昭君",@"玉环",@"貂蝉", nil];
              
       }
       return self;
}
-(NSInteger)countOfMgen
{
       return [list count];
       
}
-(id)objectInMgenAtIndex:(NSUInteger)index
{
       return [list objectAtIndex:index];
}

@end
