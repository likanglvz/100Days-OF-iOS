//
//  ViewController.m
//  TestBotton
//
//  Created by AppleUser on 16/4/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

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
- (IBAction)pressBotton:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    NSString *s=[NSString stringWithFormat:@"按下了%@按钮",title];
    self.statusLabel.text=s;
}

@end
