//
//  draw.h
//  exercise2
//
//  Created by AppleUser on 16/4/7.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol draw <NSObject>
//@optional
-(void)draw;
-(id)initWithName:(NSString *)name;
@end
