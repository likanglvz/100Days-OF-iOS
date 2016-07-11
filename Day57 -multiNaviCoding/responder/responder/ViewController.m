//
//  ViewController.m
//  responder
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//点击开始触发
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches begin");
    
}
//点击结束时触发
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches End");
    
}

//移动触发
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    //返回触摸点当前坐标
    CGPoint current = [touch locationInView:self.view];
    
    //取得前一个位置
    CGPoint previous = [touch previousLocationInView:self.view];
    
    //标签的中心位置
    CGPoint center = self.label.center;
    
    //移动的偏移量
    CGPoint offset = CGPointMake(current.x-previous.x, current.y-previous.y);
    
    //重新设定标签位置
    self.label.center = CGPointMake(center.x+offset.x, center.y + offset.y);
    
    

    
}



@end

/*
 响应者链： 是一个变化的对象集合，能够响应用户事件。
 视图结构是一个N叉树（一个视图可以有多个子视图，一个子视图在同一时刻只能有一个父视图）。每个继承自uiresponder的对象都可以在树中成为一个叶节点，当叶子节点成为第一响应者时，可以向其父节点追溯出一条响应者的链路－－－响应者链
 
 
 
 */

