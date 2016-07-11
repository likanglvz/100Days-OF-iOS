//
//  ViewController.m
//  calculatorDemo
//
//  Created by baiheng on 16/5/6.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myView;

@property(strong,nonatomic) MyModel * myModel;


@end

@implementation ViewController

//view 通过action向controller报告事件的发生

- (IBAction)run:(id)sender {
    UIButton * uiBtn = (UIButton *)sender;
    //取按钮标题
    NSString * title = uiBtn.currentTitle;
    //controller 直接与model对话
    [self.myModel setModel:[title characterAtIndex:0]];
    
    //显示计算结果
    NSString * s = [self.myModel getModel];
    //controller可以直接和view对话，通过outlet属性直接访问view
    self.myView.text = s;
    
    
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myModel = [[MyModel alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
