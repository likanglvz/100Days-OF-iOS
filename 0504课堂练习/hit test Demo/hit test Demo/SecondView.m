//
//  SecondView.m
//  hit test Demo
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SecondView.h"
@interface SecondView()

@property(nonatomic,strong) UIButton *buttonSecond;



@end

@implementation SecondView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(20, 80, 100, 50);
        [button2 setTitle:@"Second" forState:UIControlStateNormal];
        
        [button2 setBackgroundColor:[UIColor blueColor]];
        
        self.buttonSecond=button2;
        
        [self.buttonSecond addTarget:self action:@selector(buttonSecondClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.buttonSecond];
        
        
    }
    
    return self;
}

-(void)buttonSecondClicked:(id)sender{
    
    NSLog(@"second button clicked!");
}


-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    
   
    
   
    
    if (hitView==self) {
         NSLog(@"11111111111111");
        return nil;
        
    }else{
         NSLog(@"2222222222222");
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
