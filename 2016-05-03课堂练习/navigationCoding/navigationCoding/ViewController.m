//
//  ViewController.m
//  navigationCoding
//
//  Created by 李康 on 16/5/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
        // Dispose of any resources that can be recreated.
    self.title=@"1";
    //创建导航条按钮
    UIBarButtonItem *aButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(methodToCall)];
    self.navigationItem.rightBarButtonItem = aButton;//设置导航条右按钮

}

- (void)didReceiveMemoryWarning {
    
}
-(void)methodToCall{
    //初始化下一级
   // DetailViewController * de = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
    
    DetailViewController * de=[self.storyboard instantiateViewControllerWithIdentifier:@"s2"];
    
   // de.view.backgroundColor = [UIColor blueColor];
    //将de压入到导航控制器栈中
    [self.navigationController pushViewController:de animated:YES];
    
    
}
@end
