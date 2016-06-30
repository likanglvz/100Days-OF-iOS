//
//  MyView.m
//  homework0505
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(100, 100, 100, 50);
        
        [button setTitle:@"Press Me" forState:UIControlStateNormal];
        
      //  [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
           [button addTarget:nil action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        
        
    }
    return self;
    
}

-(void)buttonTapped:(id)sender
{
    //NSLog(@"button tapped");
    [self.delegate buttonPressed];
    
    
}


@end
