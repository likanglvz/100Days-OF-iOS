//
//  ViewController.m
//  homework0505
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyView * view = [[MyView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:view];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)buttonPressed
{
    NSLog(@"buttonPressed");
    
}



@end
