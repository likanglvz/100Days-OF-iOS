//
//  main.m
//  testFileManager
//
//  Created by baiheng on 16/5/9.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    /*
        NSString * fName = @"testfile";
        
        NSFileManager * fm;
        
        NSDictionary * attr;
        
        //文件管理器－－－单例
        fm = [NSFileManager defaultManager];
        
        //打印当前路径
        NSString * path = [fm currentDirectoryPath];
        NSLog(@"%@",path);
        //判断文件是否存在
        if ([fm fileExistsAtPath:fName] == NO) {
            NSLog(@"file doesnt exist");
           // return 1;
            
        }
        
        //文件拷贝
        if ([fm copyItemAtPath:fName toPath:@"newfile" error:nil]) {
            NSLog(@"file copy finished");
        }
        
        //文件内容比较
        if ([fm contentsEqualAtPath:fName andPath:@"newfile"] == NO) {
            NSLog(@"files are not equal");
           // return 3;
            
        }
        
        //文件改名
        if ([fm moveItemAtPath:@"newfile" toPath:@"newfile2" error:nil] == NO) {
            NSLog(@"file rename failed");
           // return 4;
            
        }
        
        
       //文件属性：size
        attr = [fm attributesOfItemAtPath:@"newfile2" error:nil];
        if (attr==nil ) {
            NSLog(@"failed to get attributes");
        }
        NSLog(@"file size %llu", [[attr objectForKey:NSFileSize]unsignedLongLongValue]);
        
        
        //删除文件
        
        if ([fm removeItemAtPath:fName error:nil] == NO) {
            NSLog(@"delete file failed");
        }
        
        
        //显示文件内容
        NSString * string = [NSString stringWithContentsOfFile:@"newfile2" encoding:NSUTF8StringEncoding error:nil];
        
        
        NSLog(@"%@",string);
        
   */
        
    /*    //使用nsdata
        
        NSFileManager * fm;
        NSData * fileData;
        
        fm = [NSFileManager defaultManager];
        
        //将文件读出至nsdata
        fileData = [fm contentsAtPath:@"newfile2"];
        
        if (fileData == nil) {
            NSLog(@"file read failed!");
            return 1;
            
        }
        
        //用nsdata创建一个文件
        if ([fm createFileAtPath:@"newfile3" contents:fileData attributes:nil] ==NO ) {
            NSLog(@"create file failed");
            return 2;
            
        }
        
        */
        
        
    /*    //file manager 目录操作
        
        NSString * dirName = @"testdir";
        
        NSFileManager * fm;
        
        NSString * path;
        
        
        fm = [NSFileManager defaultManager];
        
        
        path = [fm currentDirectoryPath];
        NSLog(@"current dir %@",path);
        
        //新创建路径
        if ([fm createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:nil] == NO) {
            
            NSLog(@"couldn't create dir");
         //   return 1;
            
            
        }
        
        //路径改名
        if ([fm moveItemAtPath:dirName toPath:@"newdir" error:nil] == NO) {
            NSLog(@"rename failed");
          //  return 2;
            
        }
        
        //改变当前路径到newdir
        if ([fm changeCurrentDirectoryPath:@"newdir"] == NO) {
            NSLog(@"change dir failed");
            return 3;
        }
        
        path = [fm currentDirectoryPath];
        NSLog(@"%@",path);
        
        */
        
    
    /*   //路径遍历
        
        NSString * path;
        NSFileManager *fm;
        NSDirectoryEnumerator * dirEnum;
        
        NSArray * dirArray;
        
        fm = [NSFileManager defaultManager];
        
        //当前路径
        path = [fm currentDirectoryPath];
        
        //路径枚举器
        dirEnum = [fm enumeratorAtPath:path];
        
        //枚举路径内容
        while ((path = [dirEnum nextObject]) != nil ) {
            NSLog(@"%@",path);
        }
        
        //另一种遍历方式
        dirArray = [fm contentsOfDirectoryAtPath:[fm currentDirectoryPath] error:nil];
        
        for (path in dirArray) {
            NSLog(@"%@",path);
            
            
        }
        
        */
        
        
        
       /*
        
        //nspathutilities.h
        
        NSString * fName = @"path.m";
        
        NSFileManager * fm;
        
        NSString * path, *tempdir, *extension, *homedir, *fullpath;
        
        NSArray * components;
        
        fm = [NSFileManager defaultManager];
        //临时路径
        tempdir = NSTemporaryDirectory();
        NSLog(@"temporary dir=%@",tempdir);
        
        
        path = [fm currentDirectoryPath];
        NSLog(@"%@",path);
        //最后的路径分量
        NSLog(@"%@",[path lastPathComponent]);
        
        //追加路径分量，得到完成路径
        fullpath = [path stringByAppendingPathComponent:fName];
        NSLog(@"fullpath to %@ is %@",fName,fullpath);
        
        //文件扩展名
        extension = [fullpath pathExtension];
        NSLog(@"extension for %@ is %@",fullpath,extension);
        
        //home 路径
        homedir = NSHomeDirectory();
        NSLog(@"your home dir is %@",homedir);
        
        
        //提取路径分量
        components = [fullpath pathComponents];
        for (path in components) {
            
            NSLog(@"%@",path);
            
        }
        
        */
        
        
        
        //fileHandle
        
        NSFileHandle * inFile, *outFile;
        
        NSData * buffer;
        
        //以读方式打开文件，返回文件句柄
        inFile = [NSFileHandle fileHandleForReadingAtPath:@"newfile"];
        
        if (inFile == nil) {
            NSLog(@"open file failed");
            return 1;
        }
        
        //在当前路径创建新文件
     //   [[NSFileManager defaultManager]createFileAtPath:@"testout" contents:nil attributes:nil];
        
        //打开文件准备写
        outFile = [NSFileHandle fileHandleForWritingAtPath:@"testout"];
        
        if (outFile == nil) {
            NSLog(@"open output file failed");
            return 2;
            
        }
        
        //清空文件，从偏移量0开始截断文件
       // [outFile truncateFileAtOffset:0];
        
        //读文件到缓冲区
        [inFile seekToFileOffset:2];
        
        buffer = [inFile readDataOfLength:4];
        
        //写数据到文件
        [outFile seekToEndOfFile];
        
        [outFile writeData:buffer];
        
        
        //关闭文件
        [inFile closeFile];
        [outFile closeFile];
        
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"testout" encoding:NSUTF8StringEncoding error:nil]);
        
        
        
    }
    return 0;
}











