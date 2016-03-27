//
//  Shopping.m
//  0324作业
//
//  Created by AppleUser on 16/3/25.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Shopping.h"

@implementation Shopping
+(NSString *)support:(NSString *)instrument{
    
    return instrument;
}
-(void)setinstrument:(NSString *)instrument{
    _instrument=[Shopping support:(NSString *)instrument];
}
@end
