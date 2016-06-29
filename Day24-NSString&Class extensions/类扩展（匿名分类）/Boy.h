//
//  Boy.h
//  类扩展（匿名分类）
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boy : NSObject
@property (nonatomic)int girlNum;
@property (nonatomic,readonly)int weight;
-(void)show;
@end
