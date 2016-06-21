//
//  main.m
//  音乐家演出
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Factory.h"
#import "Musician.h"

int main(int argc, const char * argv[]) {
    Musician *m = [Musician new];
    
    Instrument *ins = [Factory getInstrumentWithName1:@"Violin"];
    [m playWithInstrument:ins];
    
    ins = [Factory getInstrumentWithName1:@"Piano"];
    [m playWithInstrument:ins];
    
    return 0;
}
