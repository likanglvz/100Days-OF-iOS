//
//  FirstViewController.m
//  multiNaviCoding
//
//  Created by 李康 on 16/5/4.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"



static NSString * CellIdentifier = @"Cell";




@interface FirstViewController ()
//省／市键值对
@property(strong,nonatomic) NSDictionary * dictData;
//城市
@property(strong,nonatomic) NSArray * listData;



@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    
    
    //读取文件
    NSString * path = [[NSBundle mainBundle]pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    
    
    UINavigationController * navigationController = self.navigationController;
    
    NSString * selectedProvince = navigationController.tabBarItem.title;
    
    if ([selectedProvince isEqualToString:@"黑龙江"]) {
       // self.title = @"黑龙江";
        self.listData = [self.dictData objectForKey:@"黑龙江省"];
    }else if ([selectedProvince isEqualToString:@"吉林"])
    {//self.title = @"吉林";
        
        self.listData = self.dictData[@"吉林省"];
    }else{
      //  self.title = @"辽宁";
        self.listData = self.dictData[@"辽宁省"];
    }
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    NSDictionary * dict = self.listData[row];
    cell.textLabel.text = dict[@"name"];
    

    
    return cell;
}
//选定单元格触发
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailViewController = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    NSDictionary * dict = self.listData[indexPath.row];
    detailViewController.title = dict[@"name"];
    detailViewController.url = dict[@"url"];
    
    
    
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
