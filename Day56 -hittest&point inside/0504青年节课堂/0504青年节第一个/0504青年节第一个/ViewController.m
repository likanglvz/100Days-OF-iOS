//
//  ViewController.m
//  0504青年节第一个
//
//  Created by AppleUser on 16/5/4.
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
//点击开始是触发
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
       NSLog(@"开始了");
}
//触摸结束时触发
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
       NSLog(@"结束了");
}
//移动触发
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
       UITouch * touch = [touches anyObject];
       //返回当前触摸点坐标
       CGPoint current = [touch locationInView:self.view];
       CGPoint laterPoint = [touch previousLocationInView:self.view];
       CGFloat dx = current.x-laterPoint.x;
       CGFloat dy = current.y-laterPoint.y;
       CGPoint center = self.label.center;
       center.x +=dx;
       center.y +=dy;
       self.label.center = center;
}

@end
