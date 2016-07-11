//
//  SecondViewController.m
//  userDefaultsDemo
//
//  Created by baiheng on 16/5/11.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"
@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UISlider *warpSlider;
@property (weak, nonatomic) IBOutlet UISwitch *engineSwitch;

@end

@implementation SecondViewController
-(void)refreshFields
{
       NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
       //读取开关状态
       self.engineSwitch.on = [defaults boolForKey:kWarpDriveKey];
       //读取滑块值
       self.warpSlider.value = [defaults floatForKey:kWarpFactorKey];
       
}
-(void)viewWillAppear:(BOOL)animated
{
       [super viewWillAppear:animated];
       [self refreshFields];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)warpSliderTouched:(id)sender {
       NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
       [defaults setFloat:self.warpSlider.value forKey:kWarpFactorKey];
}
- (IBAction)engineSwitch:(id)sender {
       
       NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
       //修改用户设置
       [defaults setBool:self.engineSwitch.on forKey:kWarpDriveKey];
       
       
       
       
}

- (IBAction)button:(id)sender {
       
       [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
       
}







@end
