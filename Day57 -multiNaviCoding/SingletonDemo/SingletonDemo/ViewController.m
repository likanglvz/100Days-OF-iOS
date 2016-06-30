//
//  ViewController.m
//  SingletonDemo
//
//  Created by 李康 on 16/5/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Singleton * singleton1 = [[Singleton alloc]init];
    Singleton * singleton2 = [[Singleton alloc]init];
    NSLog(@"%p,%p",singleton1,singleton2);
    
    Singleton * singleton3 = [Singleton sharedInstance];
    Singleton * singleton4 = [Singleton sharedInstance];
    NSLog(@"%p,%p",singleton3,singleton4);
    
    NSNotificationCenter * notif = [[NSNotificationCenter alloc]init];
    NSNotificationCenter * notif2 = [NSNotificationCenter defaultCenter];
    
    NSLog(@"%p,%p",notif,notif2);
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    
    //打开浏览器
    NSURL * url = [NSURL URLWithString:@"http://www.163.com"];
  //  [[UIApplication sharedApplication]openURL:url];
    
    //拨电话
 //   [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://10000"]];
    
    
//
    //发邮件
   // [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"mailto://bai_heng@126.com"]];
    

    //打开地图
    
//   NSString * addressText = @"Nanjing";
//    NSString * urlText = [NSString stringWithFormat:@"http://maps.apple.com/maps?q=%@",addressText];
//    
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlText]];
//    
    
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"baihengDev://"]];

    
}

@end
