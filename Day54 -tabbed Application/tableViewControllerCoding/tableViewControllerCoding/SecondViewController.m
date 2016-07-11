//
//  SecondViewController.m
//  tableViewControllerCoding
//
//  Created by 李康 on 16/5/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self!=nil) {
        self.title = @"Second";//标题
        
        self.tabBarItem.image = [UIImage imageNamed:@"SecondTab"];//图像
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 30)];
    lab.text = @"viewcontroller 2 ";
    [self.view addSubview:lab];
    
    
    
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
