//
//  main.m
//  作业1
//
//  Created by 李康 on 16/3/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str = @"abc 巨\n，1.4/";
    int digitalNum = 0;
    int chineseNum = 0;
    int englistNum = 0;
    int other = 0;
    unichar tmp = 0;
    for (int i = 0; i<str.length; i++) {
        tmp = [str characterAtIndex:i];
        if (tmp>='0'&&tmp<='9') {
            digitalNum++;
        }else if ((tmp>='a'&&tmp<='z')||(tmp>='A'&&tmp<='Z')){
            englistNum++;
        }else if (tmp>255){
            chineseNum++;
        }else{
            other++;
        }
    }
    NSLog(@"中文数字为:%d,英文字母：%d,数字：%d,other:%d",chineseNum,englistNum,digitalNum,other);
    return 0;
}
