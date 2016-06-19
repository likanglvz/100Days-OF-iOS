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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touch began");
    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touch end");
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    //返回触摸点的当前坐标
    CGPoint currtnt = [touch locationInView:self.view];
    //取得前一个位置N
    CGPoint last = [touch previousLocationInView:self.view];
    
    //CGRect frame=self.view.frame;
    CGPoint center = self.label.center;
    center.x+=currtnt.x-last.x;
    center.y+=currtnt.y-last.y;
    
    self.label.center=center;
    
}

/*
 
 响应者链：是一个变化的对象集合，能够响应用户事件
 视图结构是一个N叉树（一个视图可以有多个子视图，一个子视图在同一时刻只能有一个父视图）。每个继承自uiresponder 的对象 都可以在树中扮演一个叶节点，当叶子节点成为第一响应者时，可以从本身 往其父节点追溯一条响应者的链路 －－响应者链
 
 
 */
@end
