//
//  ViewController.m
//  mas
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//
#define MAS_SHORTHAND
#import "ViewController.h"
#import "Masonry.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView*greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview: greenView];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview: redView];
    
    UIView *blueView  =[[UIView alloc]init];
    blueView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *superView = self.view;
    
    int padding = 30;
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superView.top).offset(padding);
        make.left.equalTo(superView.left).offset(padding);
        make.bottom.equalTo(blueView.top).offset(-padding);
        make.right.equalTo(redView.left).offset(-padding);
        make.height.equalTo(redView.height);
        make.width.equalTo(redView.width);
        make.height.equalTo(blueView.height);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.left.equalTo(greenView.mas_right).offset(padding);
        make.width.equalTo(greenView.mas_width);
        make.height.equalTo(@[greenView.mas_height,blueView.mas_height]);
       // make.height.equalTo(blueView.mas_height);
  
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.bottom.equalTo(superView.mas_bottom).offset(-padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.height.equalTo(@[greenView.mas_height,redView.mas_height]);
    }];
    
    
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
