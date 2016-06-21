//
//  Factory.h
//  音乐家演出
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Instrument.h"
@interface Factory : NSObject
+(Instrument*)getInstrumentWithName:(NSString*)name;
+(Instrument*)getInstrumentWithName1:(NSString*)name;
@end
