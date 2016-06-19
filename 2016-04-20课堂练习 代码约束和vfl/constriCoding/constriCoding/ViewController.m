//
//  ViewController.m
//  constriCoding
//
//  Created by 李康 on 16/4/20.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *blueview = [[UIView alloc]init];
    blueview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:blueview];
    
    
    //关闭autoresizing到约束条件
    blueview.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    
    
    //宽度约束
    NSLayoutConstraint *width= [NSLayoutConstraint constraintWithItem:blueview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    //高度约束
    NSLayoutConstraint *hight = [NSLayoutConstraint constraintWithItem:blueview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [blueview addConstraint:width];
    [blueview addConstraint:hight];
    
    //中心X约束
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:blueview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    //中心Y约束
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:blueview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    
    
    
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];

    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    view1.translatesAutoresizingMaskIntoConstraints=NO;
    view2.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *view1top =[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    NSLayoutConstraint *view2top =[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    NSLayoutConstraint *view1left=[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:16.0];
    
//    NSLayoutConstraint *view1right = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:8.0];
        NSLayoutConstraint *view2left = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeRight multiplier:1.0 constant:8.0];

    
    
    NSLayoutConstraint *height1=[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint *height2=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    
    
    NSLayoutConstraint *view2right=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-8.0];
    
    NSLayoutConstraint *wight=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    
//    NSLayoutConstraint *view2left=[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeRight multiplier:1.0 constant:8.0];

   [view1 addConstraint:height1];
    [self.view addConstraint:wight];
   [view2 addConstraint:height2];
   
    [self.view addConstraint:view1top];
    [self.view addConstraint:view1left];
    //[self.view addConstraint:view1right];
    [self.view addConstraint:view2top];
    [self.view addConstraint:view2right];
    [self.view addConstraint:view2left];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
    
    
}


//-(void)viewDidLayoutSubviews{
//    
//    self.view.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
//}
















@end
