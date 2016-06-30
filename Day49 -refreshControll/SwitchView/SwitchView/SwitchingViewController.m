//
//  ViewController.m
//  SwitchView
//
//  Created by 李康 on 16/4/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SwitchingViewController.h"
#import "Blue.h"
#import "Yellow.h"

@interface SwitchingViewController ()
@property(strong,nonatomic) Yellow *yellowViewController;
@property(strong,nonatomic) Blue *blueViewController;

@end

@implementation SwitchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blue"];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchViews:(id)sender {
    //标记动画块开始
    [UIView beginAnimations:@"View Flip" context:NULL];
    //动画持续时间
    [UIView setAnimationDuration:1.0];
    //动画曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    
    
    //如果当前显示的是蓝色视图，实例化黄色视图控制器，去掉蓝色视图，现实黄色视图
    if (!self.yellowViewController.view.superview) {//黄色视图没显示
        if (!self.yellowViewController) {//黄色视图没有实例化
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"yellow"];
            
        }
        //加入动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
        
    }
    else{
        //如果当前显示的是黄色视图，去掉黄色视图，显示蓝色视图
         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
  
    }
    // 标记动画块的结束
    [UIView commitAnimations];
    
    
    
}

@end
