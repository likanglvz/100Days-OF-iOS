//
//  MasterViewController.m
//  tablecoredata
//
//  Created by 李康 on 16/5/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"


@interface MasterViewController ()
{
    
    int sss;
    
    
}


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //添加导航条按钮
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    

}
-(void)insertNewObject:(id)sender{
    
    sss++;
    int sec;
    if (sss%2 == 0) {
        sec = 1;
    }else{
        sec = 2;
    }
    
    //托管对象上下文
    NSManagedObjectContext *context = [self.fetcheResultsController managedObjectContext];
    //实体描述
    NSEntityDescription *entity = [[self.fetcheResultsController fetchRequest]entity];
    //创建信的托管对象，插入上下文
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity  name] inManagedObjectContext:context];
    
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
    [newManagedObject setValue:@(sec) forKey:@"section"];
    
    
    
    NSError *error ;
    //存盘保存
    if (![context save:&error]) {
        NSLog(@"保存失败！");
        abort();
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Fetched results controller

-(NSFetchedResultsController *)fetcheResultsController{
    if (_fetcheResultsController!=nil) {
        
        return _fetcheResultsController;
        
    }
    //从appdelegate的到coredate的托管对象上下文
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    self.managedObjectContext = context;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    //实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    //提取请求的实体
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"timeStamp" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    //创建提取结果控制器
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"section" cacheName:nil];
    
    aFetchedResultsController.delegate = self;
    
    self.fetcheResultsController = aFetchedResultsController;
    NSError *error;
    
    //执行提取请求
    if (![self.fetcheResultsController performFetch:&error]) {
        NSLog(@"%@",error);
        abort();
    }
    
    
    
    return _fetcheResultsController;
    
    
}
//对象改变触发
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    UITableView *tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            //提取结果托管对象增加，表示图要增加单元格
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
  
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
            
        default:
            break;
    }
  
}

//托管对象节改变触发
-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        default:
            break;
    }
    
}




//在提取结果控制器在处理一个或多个改变之 前 会调用
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView beginUpdates];
 
}


//在提取结果控制器在处理一个或多个改变之 后 会调用
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView endUpdates];

    
}
//下一级
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController * detailViewcontroller = (DetailViewController *)[[segue destinationViewController] topViewController];
        
         NSManagedObject *object = [self.fetcheResultsController objectAtIndexPath:indexPath];
    
        NSString * s1 =[[object valueForKey:@"timeStamp"]description];
        detailViewcontroller.str = s1;
        
        
        
    }
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  //通过提取结果控制器section属性返回结束
    return [[self.fetcheResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //section索引所代表的某节的对象个数
    id <NSFetchedResultsSectionInfo>sectionInfo = [self.fetcheResultsController sections][section];
    
    
    return [sectionInfo numberOfObjects];
  
    
}
//节头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    id<NSFetchedResultsSectionInfo>sectionInfo = [self.fetcheResultsController sections][section];
    
    return [sectionInfo name];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSManagedObject *object = [self.fetcheResultsController objectAtIndexPath:indexPath];
    //托管对象时间戳属性，写入单元格的文本框
    cell.textLabel.text = [[object valueForKey:@"timeStamp"]description];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //删除对应的托管对象
        NSManagedObject *object = [self.fetcheResultsController objectAtIndexPath:indexPath];
        
        [self.managedObjectContext deleteObject:object];
        NSError *error;
        
        [self.managedObjectContext save:&error];

        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
