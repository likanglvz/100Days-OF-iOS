//
//  Factory.m
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "Factory.h"
@implementation Factory
+(id)getShape:(NSString *)shapeName{
    static NSMutableDictionary * dic=nil;
    if (dic==nil) {
        dic=[NSMutableDictionary new];
    }
    NSObject *tmp;
    if (nil==[dic objectForKey:shapeName]) {
        Class c=NSClassFromString(shapeName);
        tmp=[c new];
        [dic setObject:c forKey:shapeName];
        return tmp;
    }else
        return [[dic objectForKey:shapeName]alloc];
}
@end


