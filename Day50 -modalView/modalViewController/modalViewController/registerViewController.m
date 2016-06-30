//
//  registerViewController.m
//  modalViewController
//
//  Created by 李康 on 16/4/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "registerViewController.h"

@interface registerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;

@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss modal view ");
        NSDictionary *dataDict = [NSDictionary dictionaryWithObject:self.userID.text forKey:@"userID"];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
        
        
        
        
        
    }];
    
    
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
