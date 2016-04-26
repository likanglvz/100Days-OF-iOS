//
//  SearchResultsController.h
//  sectionTableView
//
//  Created by 李康 on 16/4/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController<UISearchResultsUpdating,UISearchBarDelegate>


-(instancetype)initWithName:(NSDictionary *)names Keys:(NSArray *)keys;

@end
