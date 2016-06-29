//
//  NSString+CountNumber.h
//  字符串的分类实现
//
//  Created by 李康 on 16/3/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CountNumber)
+(int)countInString:(NSString*)str;
-(int)countInCurrentString;
-(BOOL)isURL;
@end
