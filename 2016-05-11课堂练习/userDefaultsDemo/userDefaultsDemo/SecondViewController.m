//
//  SecondViewController.m
//  userDefaultsDemo
//
//  Created by 李康 on 16/5/11.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"


@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UISlider *warpFactorSlider;
@property (weak, nonatomic) IBOutlet UISwitch *enginSwitch;


@end

@implementation SecondViewController
-(void)refreshFields{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //读取开关状态
    self.enginSwitch.on = [defaults boolForKey:kWarpKey];
    //读取滑块的值
    self.warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];

    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self refreshFields];
    
}

- (IBAction)engineSwitchTapped:(UISwitch *)sender {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //修改用户设置
    [defaults setBool:self.enginSwitch.on forKey:kWarpKey];
    
    
    
    
}
- (IBAction)warpSliderTouched:(UISlider *)sender {
     NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
