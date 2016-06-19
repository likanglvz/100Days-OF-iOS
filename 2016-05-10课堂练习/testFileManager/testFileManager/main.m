//
//  main.m
//  testFileManager
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
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
 
 */

/*
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager *fm;
        NSData *fileData;
        fm = [NSFileManager defaultManager];
        //将文件读出至nsdata
        fileData = [fm contentsAtPath:@"newfile2.txt"];
        
        if (fileData == nil) {
            NSLog(@"读取失败");
            return 1;
        }
        //用nsdata创建一个文件
        if ([fm createFileAtPath:@"newfile3" contents:fileData attributes:nil]== NO) {
            NSLog(@"文件创建失败");
        }
        
        
        
        
        
        
    }
        return 0;
}

*/

int main() {
    
    /*
    NSString *dirName = @"testdir";
    
    NSFileManager *fm ;
    
    NSString *path;
    
    fm = [NSFileManager defaultManager];
    
    path = [fm currentDirectoryPath];
    NSLog(@"current dir %@",path);
    
    
    //新创建路径
    
    if ([fm createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:nil]==NO) {
        NSLog(@"could't creat dir ");
        return 1;
    }
    
    if ([fm moveItemAtPath:dirName toPath:@"newdir" error:nil]==NO) {
        NSLog(@"rename faied");
        //return 2;
        
    }
    
    //修改当前路径
    if ([fm changeCurrentDirectoryPath:@"newdir"]==NO) {
        NSLog(@"change dir failed");
        return 3;
    }
    path = [fm currentDirectoryPath];
    NSLog(@"current dir %@",path);
    
    
    //路径遍历
    NSString *path ;
    NSFileManager *fm ;
    NSDirectoryEnumerator *dirEnum;
    
    NSArray *dirArray;
    fm = [NSFileManager defaultManager];
    path  = [fm currentDirectoryPath];
    dirEnum = [fm enumeratorAtPath:path];
    
    */
    
    
    
    NSFileHandle *inFile,*outFile;
    
    NSData *buffer;
    
    //以读方式打开文件，返回文件句柄
    inFile = [NSFileHandle fileHandleForReadingAtPath:@"newfile.txt"];
    
    if (inFile == nil) {
        NSLog(@"open file failed");
        //return 1;
    }
    //在当前路径创建新文件
    [[NSFileManager defaultManager]createFileAtPath:@"textout" contents:nil attributes:nil];
    
    //打开文件准备写
    outFile = [NSFileHandle fileHandleForWritingAtPath:@"textout"];
    
    if (outFile ==nil) {
        NSLog(@"open outputfile failed");
        return 2;
    }
    //清空文件，从偏移量0开始截断文件
    [outFile truncateFileAtOffset:0];
    //读文件到缓冲区
    
    //[inFile seekToFileOffset:2];//偏移两个字节开始读
    
   buffer = [inFile readDataToEndOfFile];
    
    //buffer = [inFile readDataOfLength:2];//读几个几个字节
    //写数据到文件
    [inFile seekToEndOfFile];
    
    [outFile writeData:buffer];
    
    //关闭文件
    
    [inFile closeFile];
    [outFile closeFile];
    
    NSLog(@"%@",[NSString stringWithContentsOfFile:@"textout" encoding:NSUTF8StringEncoding error:nil]);
    
    
    
    
    return 0;
}
















