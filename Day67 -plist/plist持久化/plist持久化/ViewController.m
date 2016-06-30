//
//  ViewController.m
//  plist持久化
//
//  Created by AppleUser on 16/5/11.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;

@end

@implementation ViewController
-(NSString * )dataFilePath
{
       NSString * document = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
       
       return  [document stringByAppendingPathComponent:@"text.plist"];
}

- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
       NSString * filePath = [self dataFilePath];
       if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
           //   NSLog(@"111");
              NSArray * manager = [[NSArray alloc]initWithContentsOfFile:filePath];
              for (int i=0; i<4; i++) {
                     UITextField * field = self.lineFields[i];
                     field.text = manager[i];
              }
              
       }
       //应用程序单例
       UIApplication * app = [UIApplication sharedApplication];
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWithResignAction:) name:UIApplicationWillResignActiveNotification object:app];
       

       
       
}
-(void)applicationWithResignAction:(NSNotification *)notification
{
       NSString* filePath = [self dataFilePath];
       //使用kvc返回文本框文本
       
       NSArray * array = [self.lineFields valueForKey:@"text"];
       [array writeToFile:filePath atomically:YES];
       
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

@end
