//
//  ModalViewController.m
//  multiNaviCoding
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建导航条
    UINavigationBar * navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    
    [self.view addSubview:navigationBar];
    
    //创建左按钮
    UINavigationItem * item = [[UINavigationItem alloc]initWithTitle:@"back"];
    item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(performBack)];
    
    [navigationBar pushNavigationItem:item animated:YES];
    

}


-(void)performBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"baihengDev://"]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
