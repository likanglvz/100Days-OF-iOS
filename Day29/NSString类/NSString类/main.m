//
//  main.m
//  NSString类
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*字符串写文件*/
        NSString *path = @"/Users/apple/Desktop/1 2.txt";
        NSString *content = @"要放假了，怎么过呢?";
        /*
         参数2：YES则会先创建一个临时文件，把字符串先写入其中，如果最后成功写入则再导入到目标文件中，如果不成功则回滚
            NO则直接写入目标文件，如果中间出问题，则可能导致目标文件不完整
         参数3：是写入文件时所用的哪一种编码。
         参数4：是一个指针地址，在方法内部：
         如果写文件出错，则NSError *e = [[NSError alloc]initWith....];
         er = e;
         
         */
        NSError *err;
        BOOL isWiriteSuccess = [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err];
        if (isWiriteSuccess) {
            NSLog(@"文件写入成功");
        }
    }
    return 0;
}
