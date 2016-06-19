//
//  AppDelegate.m
//  collectingLayoutCoding
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CircleLayout.h"



@interface AppDelegate ()

@property(strong,nonatomic) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.viewController = [[ViewController alloc]initWithCollectionViewLayout:[[CircleLayout alloc]init]];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
/*
自定义collectionView的layout：
  需要创建uicollectionviewlayout的子类，通过以下方法传递布局信息:
 
 
 1.prepareLayout方法，布局的准备工作.
 2.通过collectionviewContentSize方法  返回内容尺寸
 3.通过layoutAttributesForElementsInRect方法  返回每个单元格的布局信息
 
 
 uicollectionViewLayoutAttributes的创建
 
   layoutAttributesForItemWithIndexPath（单元格的）,
   layoutAttributesForSupplementaryViewOfKind(补充视图的)
   layoutAttributesForDecorationViewOfKind（装饰视图的）
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

*/