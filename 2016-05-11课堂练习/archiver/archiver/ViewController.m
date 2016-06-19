//
//  ViewController.m
//  archiver
//
//  Created by 李康 on 16/5/11.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "BoyFriend.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

-(void)createBoyFriend{
    
    BoyFriend *p1 =[[BoyFriend alloc]init];
    p1.age = 25;
    p1.name = @"李云龙";
    p1.height = 1.77;
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documents stringByAppendingPathComponent:@"boyfriend1.archiver"];
//    
//    NSLog(@"%@",path);
    //归档p1对象 写入文件
    //[NSKeyedArchiver archiveRootObject:p1 toFile:path];
    
    
    
    NSMutableData *data = [[NSMutableData alloc]init];
    //使用data对象初始化归档器
    NSKeyedArchiver *achiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //编码指定的对象
    [achiver encodeObject:p1 forKey:@"boyfriend"];
    [achiver finishEncoding];
    //写入文件
    BOOL success = [data writeToFile:path atomically:YES];
    
    if (!success) {
        NSLog(@"失败");
    }
    
    
    
    
    
    
    
}
-(void)readBoyFriend{
    
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *path = [documents stringByAppendingPathComponent:@"boyfriend1.archiver"];

    //使用反归档器 解出对象
    //BoyFriend*p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    BoyFriend*p2 =[[BoyFriend alloc]init];
    
    NSData *data =[[NSData alloc] initWithContentsOfFile:path];
    
    
    NSKeyedUnarchiver *unarchiver =[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
     p2=[unarchiver decodeObjectForKey:@"boyfriend"];
    
    [unarchiver finishDecoding];
    
    self.textField.text = [NSString stringWithFormat:@"%@",p2];
    

    
    
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
