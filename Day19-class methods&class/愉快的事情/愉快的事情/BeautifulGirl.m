//
//  BeautifulGirl.m
//  愉快的事情
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "BeautifulGirl.h"

@implementation BeautifulGirl
-(void)setAge:(int)age
{
    _age = age;
}
-(int)age
{
    return _age;
}
-(NSString *)favorite
{
    return _favorite;
}
-(void)setFavorite:(NSString *)f
{
    _favorite = f;
}
-(void)playWithMaster
{
    NSLog(@"我喜欢%@,你喜欢吗？",_favorite);
}
@end
