//
//  BeautifulGirl.h
//  愉快的事情
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeautifulGirl : NSObject
{
    int _age;
    NSString* _favorite;
}
-(void)setAge:(int)age;
-(int)age;
-(void)setFavorite:(NSString *)f;
-(NSString*)favorite;
-(void)playWithMaster;
@end
