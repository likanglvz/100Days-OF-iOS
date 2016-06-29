//
//  Musician.h
//  音乐家演出
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrument.h"
@interface Musician : NSObject
-(void)playWithInstrument:(Instrument*)ins;
@end
