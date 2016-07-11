//
//  ViewController.h
//  0503homework
//
//  Created by 李康 on 16/5/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UINavigationItem *nav;

-(id)initWith:(NSString *)s;
@end

