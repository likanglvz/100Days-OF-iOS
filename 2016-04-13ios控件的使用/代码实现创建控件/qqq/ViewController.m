//
//  ViewController.m
//  qqq
//
//  Created by AppleUser on 16/4/13.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(110.0,40.0,200,100)];
    imageView.image = [UIImage imageNamed:@"mylogo.png"];
    [self.view addSubview:imageView];
    
    
    UILabel *scoreLable1 = [[UILabel alloc]initWithFrame:CGRectMake(20.0,100.0,200.0,150.0)];
    scoreLable1.text=@"Name";
    [self.view addSubview:scoreLable1];
    
    UILabel *scoreLable2 = [[UILabel alloc]initWithFrame:CGRectMake(20.0,150.0,200.0,150.0)];
    scoreLable2.text=@"Number";
    [self.view addSubview:scoreLable2];
    
    UITextField *text1= [[UITextField alloc]initWithFrame:CGRectMake(100, 160, 230, 30)];
    
    text1.borderStyle = UITextBorderStyleRoundedRect;
    text1.backgroundColor = [UIColor grayColor];
    //[text1 resignFirstResponder];
    
    
    
    
    [self.view addSubview:text1];
    UITextField *text2= [[UITextField alloc]initWithFrame:CGRectMake(100, 210, 230, 30)];
    
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:text2];

    UILabel *scoreLable3 = [[UILabel alloc]initWithFrame:CGRectMake(20.0,250.0,200.0,150.0)];
    scoreLable3.text=@"laber";
    [self.view addSubview:scoreLable3];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(120.0, 315.0, 250.0, 20.0)];
    slider.minimumValue = 1;
    slider.maximumValue = 100;
    slider.value = 50;
    //[slider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    
    //[slider addTarget:self action:@selector(sliderValueChange:)
    // forControlEvents:UIControlEventValueChanged];
    
    //开关
    UISwitch *switchView1 = [[UISwitch alloc] initWithFrame:CGRectMake(30.0, 440.0, 100.0, 28.0)];
    [self.view addSubview:switchView1];
    UISwitch *switchView2 = [[UISwitch alloc] initWithFrame:CGRectMake(330.0, 440.0, 100.0, 28.0)];
    [self.view addSubview:switchView2];
    
    //分段开关
    NSArray * arr = @[@"开关",@"按钮"];
    //初始化UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:arr];
    segmentedControl.frame = CGRectMake((self.view.bounds.size.width / 2)-100, 370.0, 200.0, 30.0);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor redColor];
    [self.view addSubview: segmentedControl];

    //按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(33, 500, 400, 20)];
    [button setTitle:@"别摸我" forState:UIControlStateNormal];
    UIImage *image=[UIImage imageNamed:@"blueButton"];
    [button setImage:image forState:UIControlStateNormal];
    
    
    
    
    [self.view addSubview: button];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
-(void)updateValue:(id)sender
{
    NSLog(@"londing");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
