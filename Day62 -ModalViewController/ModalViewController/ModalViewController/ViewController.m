//
//  ViewController.m
//  ModalViewController
//
//  Created by baiheng on 16/4/27.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

}





//由通知得到数据
-(void)registerCompletion:(NSNotification *)notification
{
    NSDictionary * theData = [notification userInfo];
    NSString * userName = [theData objectForKey:@"userID"];
    self.userName.text = userName;
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)registerButtonPressed:(id)sender {
    
    //获得故事板对象
    UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //实例化故事板中的视图控制器
    UIViewController * registerViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"registerViewController"];
    
    
      [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:registerViewController];
    
    //视图切换的样式
    registerViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //呈现模态视图
    [self presentViewController:registerViewController animated:YES completion:^{
        NSLog(@"present Modal View");
    }];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
   // [super viewWillDisappear:animated];
    
  //  [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    
    NSLog(@"view  will disappear");
}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//     NSLog(@"view  did disappear");
//}

-(void)viewWillAppear:(BOOL)animated
{
  //  [super viewWillAppear:animated];
  
   
    
    
    NSLog(@"view will appear");
}

//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog(@"view did appear");
//}



@end














