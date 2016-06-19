//
//  ViewController.m
//  filePersistence
//
//  Created by AppleUser on 16/5/10.
//  Copyright © 2016年 NeXT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextField *textField2;

@property (weak, nonatomic) IBOutlet UITextField *textField3;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=paths[0];
    //追加过文件名的完整路径
    NSString *fName=[documentDirectory stringByAppendingPathComponent:@"textField"];
    NSLog(@"%@",fName);
    NSError *error;
    //读文件显示到文本框
    NSString *stringRead=[[NSString alloc]initWithContentsOfFile:fName encoding:NSUTF8StringEncoding error:&error];
    
    self.textField.text=stringRead;
    
    NSFileManager *fm;
    NSData *fileData;
    fm = [NSFileManager defaultManager];
    fileData = [fm contentsAtPath:@"textField"];
    
    [fm createFileAtPath:@"textField2" contents:fileData attributes:nil];
    NSString *sname =[documentDirectory stringByAppendingPathComponent:@"textField2"];
    NSString *stringRead2=[[NSString alloc]initWithContentsOfFile:sname encoding:NSUTF8StringEncoding error:&error];

    
    self.textField2.text =stringRead2;

    
    
//    NSString *stringRead3=[[NSString alloc]initWithContentsOfFile:tname encoding:NSUTF8StringEncoding error:&error];
    
   
   
    
    //NSString *stringRead3=[[NSString alloc]initWithContentsOfFile:tname encoding:NSUTF8StringEncoding error:&error];
    
    
    NSString *tname =[documentDirectory stringByAppendingPathComponent:@"textout"];
    
    fileData =[fm contentsAtPath:tname];
    
    
    self.textField3.text =[[NSString alloc]initWithData:fileData encoding:NSUTF8StringEncoding];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //将文本框的内容存入文件
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=paths[0];
    //追加过文件名的完整路径
    NSString *fName=[documentDirectory stringByAppendingPathComponent:@"textField"];
    
    NSError *error;
    //取得文本框中的内容
    NSString *string=textField.text;
    //写入文件
    [string writeToFile:fName atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    [textField resignFirstResponder];

    //
    
    NSString *sname =[documentDirectory stringByAppendingPathComponent:@"textField2"];
     [string writeToFile:sname atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    
    //
    
    
    
     NSString *tname =[documentDirectory stringByAppendingPathComponent:@"textout"];
    NSFileHandle *read = [NSFileHandle fileHandleForReadingAtPath:fName];

    [[NSFileManager defaultManager]createFileAtPath:tname contents:nil attributes:nil];



    NSFileHandle *write = [NSFileHandle fileHandleForWritingAtPath:tname];
    
    
    [read seekToFileOffset:2];
    
    NSData *buffer = [read readDataToEndOfFile];
    
    [write writeData:buffer];
    
    [read closeFile];
    [write closeFile];
    
        return YES;
}

@end
