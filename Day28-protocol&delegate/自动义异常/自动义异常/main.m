//
//  main.m
//  自动义异常
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
int main(int argc, const char * argv[]) {
    Car *c = [Car new];
    @try {
        [c setNum:-20];
    }
    @catch (NSException *e) {
        if([e.name isEqualToString:@"人数超载"]){
            NSLog(@"人太多,罚钱!");
//            @throw e;正确
            @throw;//正确,跟上面相同,只有在catch中可以不带参数
        }else if ([e.name isEqualToString:@"人太少"]){
            NSLog(@"人太少,罚钱!");
//            [e raise];
        }
    }
    @finally{
        NSLog(@"人太多,太少,正合适,都罚钱!");
    }
    return 0;
}
