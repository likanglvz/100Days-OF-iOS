//
//  ViewController.m
//  hit test Demo
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

#import "FirstView.h"
#import "SecondView.h"
#import "thirdView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FirstView *firstView = [[FirstView alloc]initWithFrame:CGRectMake(20, 200, 200, 200)];
    firstView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:firstView];
    
    
    SecondView *secondView = [[SecondView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
    secondView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    [self.view addSubview:secondView];
    
    thirdView *thirdview = [[thirdView alloc]initWithFrame:CGRectMake(230, 150, 100, 200)];
    thirdview.backgroundColor = [UIColor redColor];
    [self.view addSubview:thirdview];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
