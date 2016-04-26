//
//  ViewController.m
//  静态表staticTable
//
//  Created by 李康 on 16/4/26.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *accessText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)singIn:(id)sender {
    if ([self.nameText.text isEqualToString:@"qwe"]&&[self.accessText.text isEqualToString:@"123"]) {
        UIAlertAction *choice =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"登录成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:choice];
        [self presentViewController:controller animated:YES completion:nil];

      
    
    
    }
}

- (IBAction)tuichu:(id)sender {
    [sender resignFirstResponder];
}
@end
