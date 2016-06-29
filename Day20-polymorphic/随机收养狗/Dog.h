//
//  Dog.h
//  随机收养狗
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    int _dogId;
}
-(void)setDogId:(int)i;
-(int)dogId;
@end
