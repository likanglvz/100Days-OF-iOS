//
//  Shape.h
//  类工厂的使用
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Shape <NSObject>
-(void)draw;
-(id)initWithName:(NSString*)name;
-(NSString*)name;
@end
