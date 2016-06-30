//
//  ViewController.m
//  localNotification
//
//  Created by baiheng on 16/3/21.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
- (IBAction)buttonPressed:(id)sender {
    
    UILocalNotification * local = [[UILocalNotification alloc]init];
    if (local) {
        //触发时间
        local.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        
        local.alertBody = @"这是我的第一个通知！";
        
        local.applicationIconBadgeNumber = 1;
        
        local.soundName = UILocalNotificationDefaultSoundName;
        
        local.timeZone = [NSTimeZone defaultTimeZone];
        
        NSDictionary * info = @{@"key":@"value"};
        local.userInfo = info;
        
        
        
        //将通知添加到系统
        [[UIApplication sharedApplication]scheduleLocalNotification:local];
        
        
        
        
    }
    
    
    
}



@end
