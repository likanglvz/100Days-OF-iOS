//
//  DetailViewController.h
//  tableViewNavigation
//
//  Created by 李康 on 16/4/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIWebViewDelegate>
@property(copy,nonatomic) NSString *url;
@end
