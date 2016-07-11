//
//  MasterViewController.h
//  tablecoredata
//
//  Created by 李康 on 16/5/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>
//提取结果控制器
@property(strong,nonatomic) NSFetchedResultsController *fetcheResultsController;
//托管对象上下文
@property(strong,nonatomic) NSManagedObjectContext *managedObjectContext;


@end
