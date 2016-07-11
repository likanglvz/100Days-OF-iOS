//
//  ViewController.m
//  0504青年节第二个
//
//  Created by AppleUser on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "FirstView.h"
#import "SecongView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
       FirstView * firstView = [[FirstView alloc]initWithFrame:CGRectMake(20, 200, 200, 200)];
       firstView.backgroundColor = [UIColor purpleColor];
       [self.view addSubview:firstView];
       
       SecongView * secondView = [[SecongView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
       secondView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
       [self.view addSubview:secondView];
       
       
       
       
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

@end
