//
//  ViewController.m
//  homework2
//
//  Created by 李康 on 16/4/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.text1.text=@"人生如戏，全凭演技";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)transform:(UIButton *)sender {
    NSString *s=@"";
    for (int i=(int)self.text1.text.length-1; i>0; i--) {
        NSString *tmp=[self.text1.text substringWithRange:NSMakeRange(i, 1)];
        s=[s stringByAppendingString:tmp];
    }
    
    self.text2.text=s;
    
}

@end
