//
//  ViewController.m
//  testca
//
//  Created by baiheng on 16/5/30.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationView.h"

@interface ViewController ()
@property (nonatomic, weak) BasicAnimationView *basicAnimationView;
@end

@implementation ViewController
-(BasicAnimationView *)basicAnimationView{
    if (_basicAnimationView == nil) {
       // BasicAnimationView *basicAnimationView = [BasicAnimationView basicAnimationView];
       // _basicAnimationView = basicAnimationView;
        //设置frame
      //  basicAnimationView.frame = CGRectMake(0, 20, 375, 150);
        
        [self.view addSubview:[BasicAnimationView basicAnimationView]];
    }
    return _basicAnimationView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self basicAnimationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
