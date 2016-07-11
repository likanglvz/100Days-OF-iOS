//
//  ViewController.m
//  testAssociate
//
//  Created by baiheng on 16/6/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "Person+EmailAddress.h"
#import "Person.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person * p1 = [[Person alloc]init];
    p1.emailAddress = @"123@1123.com";
    NSLog(@"%@",p1.emailAddress);
    
    
      
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
