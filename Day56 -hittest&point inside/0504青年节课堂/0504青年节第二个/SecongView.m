//
//  SecongView.m
//  0504青年节第二个
//
//  Created by AppleUser on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SecongView.h"

@interface SecongView ()

@property (nonatomic,strong) UIButton * buttonSecond;

@end

@implementation SecongView

-(id)initWithFrame:(CGRect)frame{
       self = [super initWithFrame:frame];
       if (self) {
              UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
              button2.frame = CGRectMake(20, 80, 100, 50);
              [button2 setTitle:@"second" forState:UIControlStateNormal];
              [button2 setBackgroundColor:[UIColor greenColor]];
              self.buttonSecond = button2;
              
              [self.buttonSecond addTarget:self action:@selector(buttonSecondClicked:) forControlEvents:UIControlEventTouchUpInside];
              
              [self addSubview:self.buttonSecond];
       }
       return self;
}
-(void)buttonSecondClicked:(id)sender
{
       NSLog(@"昨夜西风凋碧树");
}

-(UIView * )hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
       UIView * hitView = [super hitTest:point withEvent:event];
       if (hitView ==self) {
              return nil;
       }else {
              return hitView;
       }
       
}

















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
