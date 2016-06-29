//
//  Run.h
//  协议的使用二
//
//  Created by 李康 on 16/3/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Run <NSObject>
-(void)go;
-(void)eat;
@optional
-(void)sleep;
@end
