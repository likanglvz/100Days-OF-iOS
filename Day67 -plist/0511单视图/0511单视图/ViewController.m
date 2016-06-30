//
//  ViewController.m
//  0511单视图
//
//  Created by AppleUser on 16/5/11.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "ViewController.h"
#import "BoyFriend-XHQ.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

-(void)createBoyFriend
{
       BoyFriend_XHQ * p1 = [[BoyFriend_XHQ alloc]init];
       p1.age= 34;
       p1.name = @"徐海乔";
       p1.height = 1.80;
       NSString * documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
       
       NSString * path = [documents stringByAppendingPathComponent:@"boyFriend.text"];
       NSLog(@"%@",path);
       //归档p1对象，写入文件
      // [NSKeyedArchiver archiveRootObject:p1 toFile:path];
       
       NSMutableData *data = [[NSMutableData alloc] init];
       NSKeyedArchiver * archiver =[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
       [archiver encodeObject:p1 forKey:@"boyFriend1"];
       [archiver finishEncoding];
       BOOL success = [data writeToFile:path atomically:YES];
       
       
       
       
       
       
}
-(void)readBoyFriend
{
       NSString * documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
       
       NSString * path = [documents stringByAppendingPathComponent:@"boyFriend.text"];
       //使用反归档器解出对象
//       BoyFriend_XHQ * p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//       self.textField.text = [NSString stringWithFormat:@"%@",p2];
       NSData * data = [[NSData alloc]initWithContentsOfFile:path];
       NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
       BoyFriend_XHQ * boy = [unarchiver decodeObjectForKey:@"boyFriend1"];
       self.textField.text = [NSString stringWithFormat:@"%@",boy];
       [unarchiver finishDecoding];
       
       
       
}
- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
       
       [self createBoyFriend];
       [self readBoyFriend];
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

@end
