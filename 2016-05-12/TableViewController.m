//
//  TableViewController.m
//  0512homework
//
//  Created by 李康 on 16/5/12.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *clear;
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *mima;

@property (weak, nonatomic) IBOutlet UITextField *xianzhi;

@property (weak, nonatomic) IBOutlet UITextField *fuwuqi;

@property (weak, nonatomic) IBOutlet UITextField *shengyin;

@property (weak, nonatomic) IBOutlet UITextField *zhendong;




@end

@implementation TableViewController

-(void)refreshField{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.name.text = [defaults objectForKey:@"name"];
    self.mima.text = [defaults objectForKey:@"code"];
    self.clear.text = [defaults boolForKey:@"clear"]?@"打开":@"关闭";
    self.xianzhi.text = [[defaults objectForKey:@"admit"]stringValue];
    self.fuwuqi.text = [defaults objectForKey:@"zone"];
    self.shengyin.text = [defaults boolForKey:@"sound"]?@"YES":@"NO";
    self.zhendong.text = [defaults boolForKey:@"shake"]?@"YES":@"NO";
    
 
    
}

-(void)applicationWillEnterForeground:(NSNotification *)notification
{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //写入持久化存储
    [defaults synchronize];
    
    
    [self refreshField];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self refreshField];
    
    UIApplication * app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshField];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapped:(UIButton *)sender {
    
    
    [self refreshField];
    
    
}


@end
