//
//  ViewController.m
//  sectionTableView
//
//  Created by 李康 on 16/4/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "SearchResultsController.h"
static NSString *sectionTableCellIdntifier = @"Cell";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSDictionary *names;
@property(strong,nonatomic)NSArray *keys;
//搜索控制器
@property(strong,nonatomic)UISearchController *searchController;



//-(void)filterContentForSearchText:(NSString *)searchText scope:(NSInteger)scope;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:sectionTableCellIdntifier];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"singer" ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *tmp=[self.names allKeys];
    
    
    self.keys =[tmp sortedArrayUsingSelector:@selector(compare:)];
    
    SearchResultsController *resultsController = [[SearchResultsController alloc]initWithName:self.names Keys:self.keys];
    //创建搜索控制器
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:resultsController];
    UISearchBar * searchBar = self.searchController.searchBar;
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.placeholder = @"查找";
    searchBar.scopeButtonTitles = @[@"所有",@"短名",@"长名"];
    searchBar.delegate=resultsController;

    //搜素结果更新器
    self.searchController.searchResultsUpdater = resultsController;
    //
    self.tableView.tableHeaderView=searchBar;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableview datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.keys count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *str=self.keys[section];
    NSArray *arr = self.names[str];
    return [arr count];
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sectionTableCellIdntifier forIndexPath:indexPath];
    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.names[key];
    cell.textLabel.text = nameSection[indexPath.row];
    
    return cell;
   
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *groupName = [self.keys objectAtIndex:section];
    return groupName;
    
    
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return self.keys;
    
}
//-(void)filterContentForSearchText:(NSString *)searchText scope:(NSInteger)scope{














@end
