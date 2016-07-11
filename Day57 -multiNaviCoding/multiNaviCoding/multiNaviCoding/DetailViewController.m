//
//  DetailViewController.m
//  multiNaviCoding
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "DetailViewController.h"
#import "ModalViewController.h"



@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:webView];
    
    
    NSURL * url = [NSURL URLWithString:self.url];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
    UIBarButtonItem * aButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushModal)];
    
    self.navigationItem.rightBarButtonItem = aButton;
    
    
    
    
    
}

-(void)pushModal
{
    ModalViewController * modalViewController = [[ModalViewController alloc]initWithNibName:nil bundle:nil];
    
    modalViewController.view.backgroundColor = [UIColor yellowColor];
    
    [self presentViewController:modalViewController animated:YES completion:nil];
    
    
    
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
