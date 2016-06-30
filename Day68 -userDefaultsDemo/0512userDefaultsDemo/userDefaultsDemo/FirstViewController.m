//
//  FirstViewController.m
//  userDefaultsDemo
//
//  Created by baiheng on 16/5/11.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "FirstViewController.h"
#import "Constants.h"



@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *officerLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorizationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpFactorLabel;

@property (weak, nonatomic) IBOutlet UILabel *favoriteTeaLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCaptainLabel;

@property (weak, nonatomic) IBOutlet UILabel *favoriteGadgetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteAlienLabel;

@end

@implementation FirstViewController

-(void)refreshFields
{
    //用户设置单例
    NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
    
    //读出设置的内容，写标签
    self.officerLabel.text = [defaults objectForKey:kOfficerKey];
    
    self.authorizationCodeLabel.text = [defaults objectForKey:kAuthorizationCodeKey];
    
    self.rankLabel.text = [defaults objectForKey:kRankKey];
    
    self.warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]?@"打开":@"关闭";
    
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]stringValue];
    
       self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
       
        self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptainKey];
        self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
        self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
    
}
-(void)viewWillAppear:(BOOL)animated
{
       [super viewWillAppear:animated];
       [self refreshFields];
       
       
       UIApplication * app = [UIApplication sharedApplication];
       //注册观察者，收听进入后台的通知
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillEnterForegroundNotification object:app];
       
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refreshFields];
       
       
      
    
}
-(void)applicationWillResignActive:(NSNotification * )notification
{
        NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
       //写入持久化存储
       [defaults synchronize];
       

       self.officerLabel.text = [defaults objectForKey:kOfficerKey];
       self.authorizationCodeLabel.text = [defaults objectForKey:kAuthorizationCodeKey];
       [self refreshFields];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
