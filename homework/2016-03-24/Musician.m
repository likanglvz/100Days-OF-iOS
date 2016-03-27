//
//  Musician.m
//  0324作业
//
//  Created by AppleUser on 16/3/25.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Musician.h"
#import "Piano.h"
#import "Violin.h"
@implementation Musician

+(void)choose:(NSString *)choice{
    if([choice isEqualToString:@"piano"]) {
        //[Violin play];
        NSLog(@"钢琴演奏");
    }
    if ([choice isEqualToString:@"violin"]) {
        //[Piano play];
        NSLog(@"小提琴演奏");
    }
    
    
    
}
@end
