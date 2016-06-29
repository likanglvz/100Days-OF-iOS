//
//  Factory.m
//  音乐家演出
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Factory.h"
#import "Violin.h"
#import "Piano.h"

@implementation Factory
+(Instrument*)getInstrumentWithName:(NSString*)name
{
    Instrument *ins = nil;
    if ([name isEqualToString:@"violin"]) {
        ins = [Violin new];
    }else{
        ins = [Piano new];
    }
    return ins;
}
+(Instrument*)getInstrumentWithName1:(NSString*)name
{
    Instrument *ins = nil;
    /*NSClassFromString通过字符串（也就是类的名字）可以产生出类对象(class对象)*/
    Class c = NSClassFromString(name);
    ins = [c new];
    return ins;
}
@end
