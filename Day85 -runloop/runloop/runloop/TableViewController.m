//
//  TableViewController.m
//  runloop
//
//  Created by 李康 on 16/5/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //定时器 每一秒钟打印一次
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(printMessage) userInfo:nil repeats:YES];
    
    //[[NSRunLoop currentRunLoop]addTimer:timer forMode:UITrackingRunLoopMode];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
//    //获取runloop
//    NSRunLoop * runloop = [NSRunLoop currentRunLoop];
//    //添加输入源
//    [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//    
//    while (!self.isCancelled&&!self.isFinish) {
//        
//        [runloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//        
    
    //}
  
}

-(void)printMessage{
    
    NSLog(@"xxxxxxxx");
    
}




/*
 runloop
 
 1.使用nsrunloop  cfrunloop
 
 2.关系密切的： nstimer,nsport,CAAnimation  CATransition,nsurlconnection,n 0｀ sobject(nsthreadPerformAddition),afnetworking
 
 3.特点：主线程对runloop在应用启动时自动创建。其他线程的runloop 需要自己启动。（不能自己创建）。
 runloop不是线程安全的，不要再其他线程调用当前线程的runloop，runloop负责处理消息事件，输入源，计时器等。
 
 4.使用场合：
 
  a. 维护线程的生命周期，让线程不自动退出
 
  b. 长驻线程，线程的生命周期和app相同
 
  c. 在一定时间内，监听某种事件
 
 
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
