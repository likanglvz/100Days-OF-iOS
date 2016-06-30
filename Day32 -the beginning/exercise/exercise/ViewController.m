//
//  ViewController.m
//  exercise
//
//  Created by AppleUser on 16/4/8.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sw;
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

- (IBAction)press:(UIButton *)sender {
    
    NSString *title=[sender titleForState:UIControlStateNormal];
    NSString *s=[NSString stringWithFormat:@"请%@",title];
    self.sw.text=s;
    NSMutableAttributedString * styledText =[[NSMutableAttributedString alloc]initWithString:s];
    
    NSDictionary *attributes=@{
        NSFontAttributeName : [UIFont boldSystemFontOfSize: _sw.font.pointSize],NSForegroundColorAttributeName : [UIColor redColor]
        };
    
    
    NSRange nameRange = [s rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    _sw.attributedText = styledText;

}


@end
