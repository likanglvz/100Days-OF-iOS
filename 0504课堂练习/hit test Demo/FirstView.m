//
//  FirstView.m
//  hit test Demo
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "FirstView.h"

@interface FirstView()
@property(nonatomic,strong) UIButton *buttonFirst;



@end




@implementation FirstView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(20, 40, 100, 50);
        [button1 setTitle:@"First" forState:UIControlStateNormal];
        
        [button1 setBackgroundColor:[UIColor blueColor]];
        
        self.buttonFirst=button1;
        
        [self.buttonFirst addTarget:self action:@selector(buttonFirstClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.buttonFirst];
    
        
    }
    
    return self;
}
//点击检测
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    //将point坐标由self（view）的坐标系统，转到button的坐标系统
//    CGPoint btnPointInFirst =[self.buttonFirst convertPoint:point toView:self];
//    //btnpoindInfires这个点在不在self.buttonfirst上面
//    if ([self.buttonFirst pointInside:btnPointInFirst withEvent:event]) {
//        return self.buttonFirst;
//        
//    }
//    return [super hitTest:point withEvent:event];
//    
//}



-(void)buttonFirstClicked:(id)sender{
    
    NSLog(@"first button clicked!");
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

/*
 1.用户点击屏幕－－》产生触摸事件－－》加入到uiapplication管理的事件队列－－》runloop调度处理
 2.先给uiwindow，uiwindow调用hittest
 
 
      hittest方法：调用当前视图的pointinside方法，判断触摸点是否在当前视图内，如果pointinside返回no，触摸点不在当前视图内，hittest可以返回nil。如果pointinside返回yes，触摸点在当前视图内，遍历当前视图的所有子视图，调用子视图的hittest方法，遍历的次序是从数组的末尾往前（从subviews末位向前）。直到子视图的hittest返回非空对象或遍历完毕。
 
 
 例子1:
 点击SecondView，没点在buttonSecond上时，
 1.触摸事件－》uiwindow －》hittest－》pointinside－》yes（触摸点在window上）－》遍历uiwindow上的子视图－》self。view－》hittest－》pointinside－》yes－》触摸点在self。view上－》遍历self。view上的所有子视图－》次序时 先secondView－》hittest－》pointinside－》yes（触摸点在secondview上）－》不在遍历firstview了－》遍历secondview的子视图－》buttonsecond－》hittest－》pointinside－》返回no－。这个点不在secondbutton上－》最终secondview是第一响应者
 
 
 
 */












