//
//  Animal.h
//  通过类方法产生对象
//
//  Created by 李康 on 16/3/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
@property NSString *name;
+(id)animal;
+(id)animalWithName:(NSString*)name;
@end
