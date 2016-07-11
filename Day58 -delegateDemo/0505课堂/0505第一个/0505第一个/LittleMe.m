//
//  ViewController.m
//  0505第一个
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "LittleMe.h"
#import "Boss.h"
@interface LittleMe ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation LittleMe

- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
       Boss * boss = [[Boss alloc]init];
       boss.delegate = self;
       [boss schedule];
       
       
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}
//实现协议方法
-(void)answerThePhone
{
       self.label.text=@"喂，小丽啊";
}
-(void)write
{
       self.label.text = @"写文案";
}
-(void)makeBed
{
       self.label.text = @"铺床";
}
@end
