//
//  ViewController.m
//  0420homework1
//
//  Created by 李康 on 16/4/20.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIButton *b1;
@property(strong,nonatomic)UIButton *b2;
@property(strong,nonatomic)UIButton *b3;
@property(strong,nonatomic)UIButton *b4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //上面的两行
    UILabel *label1=[[UILabel alloc]init];
    label1.backgroundColor=[UIColor yellowColor];
    label1.text=@"左上";
    
    UILabel *label2=[[UILabel alloc]init];
    label2.backgroundColor=[UIColor yellowColor];
    label2.text=@"右上";
    label2.textAlignment=NSTextAlignmentRight;
    
    
    label1.translatesAutoresizingMaskIntoConstraints=NO;
    label2.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    NSLayoutConstraint *laber1top =[NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *laber2top =[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *label2right=[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-8.0];
    
    NSLayoutConstraint *label2left=[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeRight multiplier:1.0 constant:8.0];
    
    NSLayoutConstraint *laber1left = [NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:8.0];
    
    NSLayoutConstraint *height1=[NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *height2=[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *wight=[NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    [label1 addConstraint:height1];
    [label2 addConstraint:height2];
    
    [self.view addConstraints:@[laber1top,laber2top,label2left,laber1left,label2right,wight]];
    
    //底部的两行
    
    UILabel *label3=[[UILabel alloc]init];
    label3.text=@"左下";
    
    UILabel *label4=[[UILabel alloc]init];
    label4.text=@"右下";
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    label3.translatesAutoresizingMaskIntoConstraints=NO;
    label4.translatesAutoresizingMaskIntoConstraints=NO;

    NSLayoutConstraint *height3=[NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    NSLayoutConstraint *height4=[NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    
    [label3 addConstraint:height3];
    [label4 addConstraint:height4];
    
    NSLayoutConstraint *label3left = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:8.0];
    
    NSLayoutConstraint *label4right = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-8.0];
    
    NSLayoutConstraint *label3bottom = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8.0];
    
    NSLayoutConstraint *label4bottom = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8.0];
    
    [self.view addConstraints:@[label3left,label3bottom,label4right,label4bottom]];

    //中间四个按钮
    
    
    
//    //中间设置了一个辅助视图
//    UIView *view=[[UIView alloc]init];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
//    view.backgroundColor=[UIColor redColor];
//    [self.view addSubview:view];
//    NSLayoutConstraint *viewh=[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0];
//    NSLayoutConstraint *vieww=[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:10.0];
//    [view addConstraints:@[viewh,vieww]];
//    NSLayoutConstraint *viewcenterX=[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
//    NSLayoutConstraint *viewcenterY=[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
//    [self.view addConstraints:@[viewcenterX,viewcenterY]];
    self.b1=[self addButtonWithTitle:@"上"];
    self.b2=[self addButtonWithTitle:@"下"];
    self.b3=[self addButtonWithTitle:@"左"];
    self.b4=[self addButtonWithTitle:@"右"];
    //b1点位置
    NSLayoutConstraint *b1X=[NSLayoutConstraint constraintWithItem:self.b1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *b1Y=[NSLayoutConstraint constraintWithItem:self.b1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-60.0];
    
    [self.view addConstraints:@[b1X,b1Y]];
    //b2的位置
    NSLayoutConstraint *b2X=[NSLayoutConstraint constraintWithItem:self.b2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *b2Y=[NSLayoutConstraint constraintWithItem:self.b2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:60.0];
    
    [self.view addConstraints:@[b2X,b2Y]];

    //b3的位置
    
    NSLayoutConstraint *b3X=[NSLayoutConstraint constraintWithItem:self.b3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-60.0];
    NSLayoutConstraint *b3Y=[NSLayoutConstraint constraintWithItem:self.b3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.view addConstraints:@[b3X,b3Y]];
    //b4的位置
    
    NSLayoutConstraint *b4X=[NSLayoutConstraint constraintWithItem:self.b4 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:60.0];
    NSLayoutConstraint *b4Y=[NSLayoutConstraint constraintWithItem:self.b4 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.view addConstraints:@[b4X,b4Y]];
    
    
    
}
    -(UIButton *)addButtonWithTitle:(NSString *)str{
        UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
        but.backgroundColor = [UIColor orangeColor];
        [but setTitle:str forState:UIControlStateNormal];
        but.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:but];
        return but;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
    
}

@end
