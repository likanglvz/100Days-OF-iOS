//
//  thirdView.m
//  hit test Demo
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "thirdView.h"
@interface thirdView()

@property(nonatomic,strong) UIButton *buttonThird;



@end

@implementation thirdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        button3.frame = CGRectMake(20, 80, 50, 50);
        [button3 setTitle:@"Third" forState:UIControlStateNormal];
        
        [button3 setBackgroundColor:[UIColor blueColor]];
        
        self.buttonThird=button3;
        
        [self.buttonThird addTarget:self action:@selector(buttonSecondClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.buttonThird];
        
        
    }
    
    return self;
}
-(void)buttonSecondClicked:(id)sender{
    
    NSLog(@"third button clicked!");
}
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    
    
    
    NSLog(@"33333333333333333333");
    
    if (hitView==self) {
        return nil;
        
    }else{
        
        return hitView;
    }
    
    
}
@end
