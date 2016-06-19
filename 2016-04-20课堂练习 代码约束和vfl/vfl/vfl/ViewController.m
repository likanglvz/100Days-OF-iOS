//
//  ViewController.m
//  vfl
//
//  Created by 李康 on 16/4/20.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property(strong,nonatomic)UIButton *addButton;
@property(strong,nonatomic)UIButton *removeButton;
@property(strong,nonatomic)UIButton *clearButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.addButton = [self addButtonWithTitle:@"Add" action:@selector(addImageView)];
    self.removeButton = [self addButtonWithTitle:@"Remove" action:@selector(removeImageView)];
    self.clearButton = [self addButtonWithTitle:@"Clear" action:@selector(clearImageView)];
    
    NSDictionary *viewDic = @{@"addButton":self.addButton,
                              @"removeButton":self.removeButton,
                              @"clearButton":self.clearButton
                              };
    
//    
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[addButton][removeButton][clearButton]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDic]];
    
    //水平 均匀分布
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[addButton]-[removeButton(==addButton)]-[clearButton(==addButton)]-|" options:0 metrics:nil views:viewDic]];
    //垂直约束
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[addButton]" options:0 metrics:nil views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[removeButton]" options:0 metrics:@{
                                                                     @"space":@30
                                                                                                                           } views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[clearButton]" options:0 metrics:nil views:viewDic]];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)addButtonWithTitle:(NSString *)str action:(SEL)abv{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeSystem];
    but.backgroundColor = [UIColor grayColor];
    [but setTitle:str forState:UIControlStateNormal];
    [but addTarget:self action:abv forControlEvents:UIControlEventTouchUpInside];
    but.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:but];
    return but;
}
-(void)addImageView{
    NSLog(@"add");
}
-(void)removeImageView{
    NSLog(@"remove");
}
-(void)clearImageView{
    NSLog(@"clear");
}

@end
