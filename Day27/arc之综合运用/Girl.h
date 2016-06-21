//
//  Girl.h
//  arc之综合运用
//
//  Created by 李康 on 16/3/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
@interface Girl : NSObject
@property (nonatomic,strong)NSString *boyName1;
@property (nonatomic,weak)NSString *boyName2;
@property (nonatomic,strong)Cat *cat1;
@property (nonatomic,weak)Cat *cat2;
@property (nonatomic,unsafe_unretained)Cat *cat3;
@end
