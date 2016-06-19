//
//  ViewController.m
//  homework
//
//  Created by 李康 on 16/5/11.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "Easonsong.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *label1;
@property (weak, nonatomic) IBOutlet UITextField *label2;
@property (weak, nonatomic) IBOutlet UITextField *label3;
@property (weak, nonatomic) IBOutlet UITextField *label4;

@end

@implementation ViewController
-(void)creatSong{
//    Easonsong *s1 = [[Easonsong alloc]init];
//     s1.song1 = self.label1.text;
//     s1.song2 = self.label2.text;
//     s1.song3 = self.label3.text;
//     s1.song4 = self.label4.text;
//    
//    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *path = [documents stringByAppendingPathComponent:@"eason.archiver"];
//    NSLog(@"%@",path);
//
//    NSMutableData *data = [[NSMutableData alloc]init];
//    //使用data对象初始化归档器
//    NSKeyedArchiver *achiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    //编码指定的对象
//    [achiver encodeObject:s1 forKey:@"song"];
//    [achiver finishEncoding];
//    //写入文件
//    BOOL success = [data writeToFile:path atomically:YES];
//    
//    if (!success) {
//        NSLog(@"失败");
//    }
//
    
}





-(void)readSong{
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documents stringByAppendingPathComponent:@"eason.archiver"];
    
    //使用反归档器 解出对象
    //BoyFriend*p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    Easonsong *s2 =[[Easonsong alloc]init];
    NSData *data =[[NSData alloc] initWithContentsOfFile:path];
    
    
    NSKeyedUnarchiver *unarchiver =[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    s2=[unarchiver decodeObjectForKey:@"song"];
    
    [unarchiver finishDecoding];
    self.label1.text = s2.song1;
    self.label2.text = s2.song2;
    self.label3.text = s2.song3;
    self.label4.text = s2.song4;


    
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //[self creatSong];
    [self readSong];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    Easonsong *s1 = [[Easonsong alloc]init];
    s1.song1 = self.label1.text;
    s1.song2 = self.label2.text;
    s1.song3 = self.label3.text;
    s1.song4 = self.label4.text;
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:@"eason.archiver"];
    NSLog(@"%@",path);
    
    NSMutableData *data = [[NSMutableData alloc]init];
    //使用data对象初始化归档器
    NSKeyedArchiver *achiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //编码指定的对象
    [achiver encodeObject:s1 forKey:@"song"];
    [achiver finishEncoding];
    //写入文件
    BOOL success = [data writeToFile:path atomically:YES];
    
    if (!success) {
        NSLog(@"失败");
    }
    
    [textField resignFirstResponder];
    
    return YES;
    
    
    
}






@end
