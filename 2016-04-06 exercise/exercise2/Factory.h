//
//  Factory.h
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "draw.h"
#import "Line.h"
#import "Square.h"
#import "Circle.h"

@interface Factory : NSObject
+(id)getShape:(NSString *)shapeName;
@end
