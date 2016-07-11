//
//  ViewController.m
//  0419作业
//
//  Created by AppleUser on 16/4/19.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic,strong) NSString *number1;
@property(nonatomic,strong) NSString *number2;
@property(nonatomic,strong) NSString *calWays;
@property(nonatomic)  int isequal;

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
- (IBAction)number:(UIButton *)sender {
    
    if (self.textField.text.length!=0) {
        while ([self.textField.text isEqualToString:@"*"]||[self.textField.text isEqualToString:@"/"]||[self.textField.text isEqualToString:@"+"]||[self.textField.text isEqualToString:@"-"]) {
            self.textField.text=@"";
        }
    }
    if (self.isequal) {
        self.textField.text=@"";

    }

    self.textField.text = [self.textField.text stringByAppendingString:sender.titleLabel.text];
    self.isequal=0;
    
    
}
- (IBAction)result:(UIButton *)sender {
    
    self.number2 = self.textField.text;
    
    self.isequal = 1;
    
    if ([self.calWays isEqualToString:@"*"]) {
        
        self.textField.text = [NSString stringWithFormat:@"%ld",self.number1.integerValue*self.number2.integerValue];
        
        
    }else if ([self.calWays isEqualToString:@"/"]){
        
        self.textField.text = [NSString stringWithFormat:@"%ld",self.number1.integerValue/self.number2.integerValue];
        
    }else if ([self.calWays isEqualToString:@"+"]){
        
        self.textField.text = [NSString stringWithFormat:@"%ld",self.number1.integerValue+self.number2.integerValue];
        
    }else if ([self.calWays isEqualToString:@"-"]){
        
        self.textField.text = [NSString stringWithFormat:@"%ld",self.number1.integerValue-self.number2.integerValue];
        
    }

    
    
    
}
- (IBAction)calWays:(UIButton *)sender {
    
    
    self.number1 = self.textField.text;
    
    self.textField.text = sender.titleLabel.text;
    
    self.calWays = sender.titleLabel.text;
}
- (IBAction)clear:(UIButton *)sender {
    
    
    self.textField.text = NULL;
    self.number2 = NULL;
    self.number1 = NULL;
    self.calWays = NULL;

    
    
    
    
}

@end
