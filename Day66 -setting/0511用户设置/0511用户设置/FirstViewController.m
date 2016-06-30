//
//  FirstViewController.m
//  0511用户设置
//
//  Created by AppleUser on 16/5/11.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "FirstViewController.h"
#import "Constans.h"



@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *officeLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorizationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpFactorLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritePoemLabel;
@property (weak, nonatomic) IBOutlet UILabel *favotiteCaptainLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteAlienLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteRankLabel;

@end

@implementation FirstViewController
-(void)refreshFields
{
       //用户设置单例
       NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
       //读出设置的内容，写标签
       self.officeLabel.text = [defaults objectForKey:kofficerKey];
       
       self.authorizationCodeLabel.text = [defaults objectForKey:kAuthorizationCodeKey];
       self.rankLabel.text = [defaults objectForKey:kRank];
       self.warpDriveLabel.text = [defaults objectForKey:kWarpDriveKey];
//       self.warpFactorLabel.text = [defaults objectForKey:kWarpFactorKey];
//       self.favoritePoemLabel.text = [defaults objectForKey:kFavoritePoemKey];
//       self.favotiteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptionKey];
//       self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
      // self.favoriteRankLabel.text = [defaults objectForKey:kFavoriteRankKey];
       
       

}
- (void)viewDidLoad {
       [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
       [self refreshFields];
       
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

@end
