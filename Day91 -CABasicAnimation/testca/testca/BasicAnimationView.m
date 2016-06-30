//
//  BasicAnimationView.m
//  testca
//
//  Created by baiheng on 16/5/30.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "BasicAnimationView.h"

@implementation BasicAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype) basicAnimationView{
    BasicAnimationView *view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:[NSObject class] options:nil] lastObject];
    return view;
}


/*移动动画实现*/
-(void) play {
    //初始化一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"bounds";//@"position";
    
    //通过toValue设置动画结束时候的状态
    animation.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 140, 200)];
    //通过byValue设置每次改变的范围
   // animation.byValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 1, 10)];
    //设置开始时候的状态
    animation.fromValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    //设置动画持续的时间
    animation.duration=2;
    //保存动画
    animation.fillMode=kCAFillModeBoth;
    animation.repeatCount = MAXFLOAT;
    //保存设置不取消
    animation.removedOnCompletion=NO;
    
   
//    CGPoint orignalPosition = self.moveView.layer.position;
//    CGFloat orignalX = orignalPosition.x;
//    CGFloat orignalY = orignalPosition.y;
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(orignalX + 250, orignalY+100)];
//    animation.duration = 1.0;
//    animation.repeatCount = MAXFLOAT;
//    animation.removedOnCompletion = NO;
    //animation.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animation forKey:nil];
}
//初始化xib时候加载图片
-(void)awakeFromNib{
    self.myView.layer.contents = (__bridge id)([UIImage imageNamed:@"9.jpg"].CGImage);
}
//点击按钮开始动画
- (IBAction)clickChange:(id)sender {
    [self play];
}


@end
