//
//  ViewController.m
//  modalViewController
//
//  Created by 李康 on 16/4/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    //添加观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
    
    //监听系统通知
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
}
//由通知得到数据

-(void)registerCompletion:(NSNotification *)noti{
    NSDictionary *theData = [noti userInfo];
    NSString *username = [theData objectForKey:@"userID"];
    self.userName.text = username;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerButtonPressed:(id)sender {
    //获得故事板对象
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //实例化故事板中的视图控制器
    UIViewController * registerViewController  = [mainStoryBoard instantiateViewControllerWithIdentifier:@"registerViewController"];
    
    //视图切换样式
    registerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //呈现模态视图
    [self presentViewController:registerViewController animated:YES completion:^{
        NSLog(@"present modal view");
    }];
    
}

@end
