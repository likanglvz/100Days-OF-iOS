//
//  ViewController.m
//  tableViewNavigation
//
//  Created by 李康 on 16/4/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "CitysTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSDictionary *dictData;
@property(strong,nonatomic) NSArray *listData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistpath = [[NSBundle mainBundle]pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:plistpath];
    
    self.listData =[self.dictData allKeys];
    
    self.title = @"省信息";
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.listData objectAtIndex:row];
    return cell;
    
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowSelectedProvience"]) {
        //得到目标视图控制器（下一级的）
        CitysTableViewController *citiesTableViewController =[segue destinationViewController];
        //得到选择的是哪一行
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow]row];
        
        NSString * selectedName = self.listData[selectedIndex];
        //传递数据
        citiesTableViewController.listData = self.dictData[selectedName];
        //第二级  导航条上的标题
        citiesTableViewController.title = selectedName;
        
        
    }
    
    
    
    
    
    
    
    
    
    
}




@end
