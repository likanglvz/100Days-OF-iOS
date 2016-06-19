//
//  main.m
//  testFileManager
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSString *fName = @"testfile.txt";
        
        NSFileManager *fm;
        
        NSDictionary *attr;
        //文件管理器－－单例
        fm = [NSFileManager defaultManager];
        //打印当前路径
        NSString *path = [fm currentDirectoryPath];
        NSLog(@"%@",path);
        //判断文件是否存在
        
        if ([fm fileExistsAtPath:fName]==NO) {
            NSLog(@"file doesn't exist");
            //return 1;
        }
        
        //文件拷贝
        if ([fm copyItemAtPath:fName toPath:@"newfile" error:nil]) {
            NSLog(@"file copy finished");
        }
        
        
        if ([fm contentsEqualAtPath:fName andPath:@"newfile"]==NO) {
            NSLog(@"files are not equal");
            //return 3;
            
        }
        
        
        if ([fm moveItemAtPath:@"newfile" toPath:@"newfile2" error:nil]==NO) {
            NSLog(@"file rename failed");
            //return 4;
        }
    
        //文件属性
        attr =[fm attributesOfItemAtPath:@"newfile2" error:nil];
        if (attr==nil) {
            NSLog(@"failed to get attributes");
        }
        
        NSLog(@"file size %llu",[[attr objectForKey:NSFileSize]unsignedLongLongValue]);
        
        
        
        if ([fm removeItemAtPath:fName error:nil]==NO) {
            NSLog(@"failed to remove file");
        }
        
        
        NSString *string = [NSString stringWithContentsOfFile:@"newfile2" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",string);
        
    }
    return 0;
}
