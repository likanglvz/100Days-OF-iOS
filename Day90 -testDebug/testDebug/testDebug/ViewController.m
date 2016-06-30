//
//  ViewController.m
//  testDebug
//
//  Created by baiheng on 16/3/22.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[];
    NSLog(@"%@",[self.dataArray objectAtIndex:10]);
    
    self.dataArray = @[@"1",@"2"];
    
    for (register int i=0; i<=1; i++) {
        NSLog(@"%@",[self.dataArray objectAtIndex:i]);
        
    }
    
    int *  a;
    NSLog(@"%d",*a);
    
    NSLog(@"%@",self.dataArray[2]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
/*
 exc_bad_access: 常出现在存取或发送消息到一个已经释放对对象
 SIGSEGV：信号段错误，有可能硬件，或者不能存取的内存地址
 SIGBUS：存取了无效内存地址
 SIGILL：在处理器上执行错误的指令。
 SIGABRT：操作系统检测到不安全的条件或进程。
 
 
 */





