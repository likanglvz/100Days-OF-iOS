//
//  SearchResultsController.m
//  sectionTableView
//
//  Created by 李康 on 16/4/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SearchResultsController.h"

static NSString *identifier =@"Cell";

@interface SearchResultsController ()

@property(strong,nonatomic)NSDictionary *names;
@property(strong,nonatomic)NSArray *keys;
@property(strong,nonatomic)NSMutableArray *filterdNames;




@end

@implementation SearchResultsController
-(instancetype)initWithName:(NSDictionary *)names Keys:(NSArray *)keys{
    self=[super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        self.names = names;
        self.keys = keys;
        self.filterdNames = [[NSMutableArray alloc]init];
    }
    
    return self;
}







- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.filterdNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = self.filterdNames[indexPath.row];
    
    
    return cell;
}
#pragma mark - UISearchResultsUpdating
static const NSUInteger longNameSize = 3;
static const NSUInteger shortNameButtonIndex = 1;
static const NSUInteger longNameButtonIndex = 2;



//当搜索条成为第一响应者，或者搜索文字改变，或者scope按钮改变
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    //搜索文本
    NSString *searchString=searchController.searchBar.text;
    //选择的scope按钮时哪一个
    NSInteger buttonIndex = searchController.searchBar.selectedScopeButtonIndex;
    //清空过滤后的数组
    [self.filterdNames removeAllObjects];
       if ([searchString length] > 0) {
      // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchString];
     NSPredicate * predicate1 = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//         if (buttonIndex == shortNameButtonIndex) {
//             while ([evaluatedObject length]<3) {
//                 NSRange range = [evaluatedObject rangeOfString:searchString options:NSCaseInsensitiveSearch];
//                 [self.filterdNames addObject:evaluatedObject];
//                 return range.location !=NSNotFound;
//                 
//             }
//         }if (buttonIndex ==longNameButtonIndex)
//             while ([evaluatedObject length]>2) {
//                 NSRange range = [evaluatedObject rangeOfString:searchString options:NSCaseInsensitiveSearch];
//                 [self.filterdNames addObject:evaluatedObject];
//                 return range.location !=NSNotFound;
//             }
         NSUInteger nameLength = [evaluatedObject length];
         
         if ((buttonIndex == shortNameButtonIndex&&nameLength>=longNameSize)||(buttonIndex == longNameButtonIndex &&nameLength<longNameSize )) {
             
             return NO;
         }

        NSRange range = [evaluatedObject rangeOfString:searchString options:NSCaseInsensitiveSearch];
        return range.location !=NSNotFound;
            
         
     }];
           
    
    for (NSString *key in self.keys) {
        //按照节循环  过滤每节中的数组
        NSArray *matchs = [self.names[key] filteredArrayUsingPredicate:predicate1];
        //过滤后的结果 添加到可变数组中
        [self.filterdNames addObjectsFromArray:matchs];
    }
    [self.tableView reloadData];
      
}
    

    
    
}

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    NSPredicate * predicate1 = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        if ([evaluatedObject length]<longNameSize) {
            return NO;
        }
        NSRange range = [evaluatedObject rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
        return range.location !=NSNotFound;
        
    }];
    NSPredicate * predicate2 = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        if ([evaluatedObject length]>=longNameSize) {
            return NO;
        }
        NSRange range = [evaluatedObject rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
        return range.location !=NSNotFound;
        
    }];
    NSPredicate * predicate3 = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSRange range = [evaluatedObject rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
        if (range.location==NSNotFound) {
            return NO;
        }
        return YES;
    }];

    
    if (selectedScope == longNameButtonIndex) {
        [self.filterdNames removeAllObjects];
        for (NSString *key in self.keys) {
        NSArray *matchs = [self.names[key] filteredArrayUsingPredicate:predicate1];
        [self.filterdNames addObjectsFromArray:matchs];
        }
        [self.tableView reloadData];
        
    }
    
    if (selectedScope == shortNameButtonIndex) {
        [self.filterdNames removeAllObjects];
        for (NSString *key in self.keys) {
            NSArray *matchs = [self.names[key] filteredArrayUsingPredicate:predicate2];
            [self.filterdNames addObjectsFromArray:matchs];
        }
        [self.tableView reloadData];
    }if (selectedScope!=shortNameButtonIndex&&selectedScope!=longNameButtonIndex) {
        [self.filterdNames removeAllObjects];
        for (NSString *key in self.keys) {
            NSArray *matchs = [self.names[key] filteredArrayUsingPredicate:predicate3];
            [self.filterdNames addObjectsFromArray:matchs];
        }
        [self.tableView reloadData];
        
        
        
    }

    
}










/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
