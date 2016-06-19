//
//  ViewController.m
//  homework1的第二种方法
//
//  Created by 李康 on 16/4/20.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIButton *b1;
@property(strong,nonatomic)UIButton *b2;
@property(strong,nonatomic)UIButton *b3;
@property(strong,nonatomic)UIButton *b4;
@property(weak,nonatomic)UILabel *label1;
@property(weak,nonatomic)UILabel *label2;
@property(weak,nonatomic)UILabel *label3;
@property(weak,nonatomic)UILabel *label4;
@property (strong,nonatomic) UIButton *leftCenter;
@property (strong,nonatomic) UIButton *rightCenter;
@property (strong,nonatomic) UIButton *upCenter;
@property (strong,nonatomic) UIButton *downCenter;
@property (strong,nonatomic) UIButton *center;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
      self.label1=[self addLabel:@"左上"];
    self.label2=[self addLabel:@"右上"];
    self.label2.textAlignment=NSTextAlignmentRight;
    self.label3=[self addLabel:@"左下"];
    self.label4=[self addLabel:@"右下"];
    self.label4.textAlignment=NSTextAlignmentRight;
    self.b1=[self addButtonWithTitle:@"上"];
    self.b2=[self addButtonWithTitle:@"下"];
    self.b3=[self addButtonWithTitle:@"左"];
    self.b4=[self addButtonWithTitle:@"右"];
   
    self.leftCenter=[self addButtonWithTitle:@"l"];
    self.rightCenter=[self addButtonWithTitle:@"r"];
    self.upCenter=[self addButtonWithTitle:@"u"];
    self.downCenter=[self addButtonWithTitle:@"d"];
    self.center=[self addButtonWithTitle:@"c"];
    
    
    
    NSDictionary *Dic = @{@"lab1" :self.label1,
                          @"lab2":self.label2,
                          @"lab3":self.label3,
                            @"lab4":self.label4,
                            @"b1":self.b1,
                            @"b2":self.b2,
                            @"b3":self.b3,
                            @"b4":self.b4,
                          @"leftCenter":self.leftCenter,
                          @"rightCenter":self.rightCenter,
                          @"upCenter":self.upCenter,
                          @"downCenter":self.downCenter,
                          @"center":self.center,
                          };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lab1]-[lab2(==lab1)]-|" options:0 metrics:nil views:Dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[lab1]" options:0 metrics:nil views:Dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[lab2]" options:0 metrics:nil views:Dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lab3]-16-|" options:0 metrics:nil views:Dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lab4]-16-|" options:0 metrics:nil views:Dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lab3]-[lab4(==lab3)]-|" options:0 metrics:nil views:Dic]];
    
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightCenter]|" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftCenter(==rightCenter)][center][rightCenter]|" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[upCenter(==downCenter)][center][downCenter]|" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[b1]-20-[center]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[leftCenter][b1][rightCenter]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[center]-20-[b2]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[leftCenter][b2][rightCenter]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[b3]-20-[center]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[upCenter][b3][downCenter]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[center]-20-[b4]" options:0 metrics:nil views:Dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[upCenter][b4][downCenter]" options:0 metrics:nil views:Dic]];
    
    
    
    
    
    
}
-(UIButton *)addButtonWithTitle:(NSString *)str{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
    //but.backgroundColor = [UIColor grayColor];
    [but setTitle:str forState:UIControlStateNormal];
    but.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:but];
    return but;
}
-(UILabel *)addLabel:(NSString *)str{
    UILabel *lab = [[UILabel alloc]init];
    lab.text=str;
    lab.backgroundColor=[UIColor yellowColor];
    lab.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:lab];
    return lab;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
