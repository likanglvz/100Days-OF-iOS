//
//  ViewController.m
//  filePersistence
//
//  Created by baiheng on 16/5/10.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCopyFile;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //读文件，显示到文本框
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * documentDirectory = paths[0];
    
    //追加文件名的完整路径
    NSString * fName = [documentDirectory stringByAppendingPathComponent:@"textFieldText"];
    
    NSLog(@"%@",fName);
    
    NSError * error;
    
    //读文件
    NSString * stringRead = [[NSString alloc]initWithContentsOfFile:@"textFieldText"encoding:NSUTF8StringEncoding error:&error];
    
    self.textField.text = stringRead;
    
    
    //第二个文件
    NSString * fName2 = [documentDirectory stringByAppendingPathComponent:@"textFieldCopyFileText"];
    
    
    NSFileManager * fm = [NSFileManager defaultManager];
//读文件到nsdata
    NSData * data = [fm contentsAtPath:fName2];
    //将nsdata 转为字符串写入文本框
    self.textFieldCopyFile.text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
    //第三个文件
    NSString * fName3 = [documentDirectory stringByAppendingPathComponent:@"textField3"];

    data = [fm contentsAtPath:fName3];
    
    
    self.textField3.text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    //将文本框中的内容存入文件
//    
//    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString * documentDirectory = paths[0];
//    
//    //追加文件名的完整路径
//    NSString * fName = [documentDirectory stringByAppendingPathComponent:@"textFieldText"];
//    
//    NSError * error;
//    
//    //文本框中的内容
//    NSString * string = textField.text;
//    //写入文件
//    [string writeToFile:fName atomically:YES encoding:NSUTF8StringEncoding error:&error];
//    
//    [textField resignFirstResponder];
//    
//    
//    
//    //第二个文件
//    NSString * fName2 = [documentDirectory stringByAppendingPathComponent:@"textFieldCopyFileText"];
//    
//    
//    NSFileManager * fm = [NSFileManager defaultManager];
//    //从string 转为 nsdata
//    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    
//    
//    if ([fm createFileAtPath:fName2 contents:data attributes:nil] == NO) {
//        NSLog(@"create file failed");
//    }
//    
//    
//    
//    //第三个文件
//    NSString * fName3 = [documentDirectory stringByAppendingPathComponent:@"textField3"];
//    //以读方式打开
//    NSFileHandle * readHandle = [NSFileHandle fileHandleForReadingAtPath:fName];
//    //创建新文件fname3
//    [[NSFileManager defaultManager]createFileAtPath:fName3 contents:nil attributes:nil];
//    //以写方式打开
//    NSFileHandle * writeHandle = [NSFileHandle fileHandleForWritingAtPath:fName3];
//    
//    //内容偏移量
//    [readHandle seekToFileOffset:2];
//    //从偏移量读到文件末尾
//    NSData * buffer = [readHandle readDataToEndOfFile];
//    //写文件
//    [writeHandle writeData:buffer];
//    
//    [readHandle closeFile];
//    [writeHandle closeFile];
//    
//    
//    return YES;
//}



@end
