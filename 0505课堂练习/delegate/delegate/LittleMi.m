//
//  ViewController.m
//  delegate
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "LittleMi.h"
#import "Boss.h"

@interface LittleMi ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation LittleMi

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Boss *boss = [[Boss alloc]init];
    boss.delegate = self;
    [boss schedule];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//实现协议方法
-(void)answerThePhone{
    
    self.label.text = @"小秘接电话";
}
-(void)write{
    
    self.label.text = @"小秘写文案";
}
-(void)makeBed{
    
    self.label.text = @"小秘造床？？";
}
@end
