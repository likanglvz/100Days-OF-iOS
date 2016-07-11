//
//  FirstView.m
//  0504青年节第二个
//
//  Created by AppleUser on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "FirstView.h"

@interface FirstView ()

@property (nonatomic,strong) UIButton * buttonFirst;

@end

@implementation FirstView
-(id)initWithFrame:(CGRect)frame{
       self = [super initWithFrame:frame];
       if (self) {
              UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
              button1.frame = CGRectMake(20, 20, 100, 50);
              [button1 setTitle:@"first" forState:UIControlStateNormal];
              [button1 setBackgroundColor:[UIColor redColor]];
              self.buttonFirst = button1;
              
              [self.buttonFirst addTarget:self action:@selector(buttonFirstClicked:) forControlEvents:UIControlEventTouchUpInside];
              
              [self addSubview:self.buttonFirst];
       }
       return self;
}
-(void)buttonFirstClicked:(id)sender
{
       NSLog(@"望尽天涯路");
}
//进行点击检测
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
       //将poine坐标由self(view)的坐标系统转到self.buttonFirst的坐标系统
       CGPoint btnPointInFirst =[self.buttonFirst convertPoint:point fromView:self];
       //btnPointInFirst在不在self.buttonFirst上
       if ([self.buttonFirst pointInside:btnPointInFirst withEvent:event]) {
              return self.buttonFirst;
       }
       return [super hitTest:point withEvent:event];
       
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
