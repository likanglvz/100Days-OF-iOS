//
//  NSString+Statistics.h
//  homework1
//
//  Created by 李康 on 16/3/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Statistics)
+(int)numInString:(NSString*)str;//数字
+(int)letterInString:(NSString*)str;//字母
+(int)symbolInString:(NSString*)str;//符号
+(int)chineseInString:(NSString*)str;//汉字


@end
