//
//  ViewController.m
//  tableView 拓展
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(strong,nonatomic)NSArray *friends;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.friends = @[@"腾讯理财通",@"一声问候",@"qq充值",@"qq音乐",@"qq提醒",@"新朋友",@"腾讯充值",@"qq附近",@"我的电脑",@"兴趣部落",@"qq团队"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.friends count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString*simpleTableCellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableCellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableCellIdentifier];
    }
    cell.textLabel.text=self.friends[indexPath.row];
    
    NSString *im = self.friends[indexPath.row];
    
    UIImage *image = [UIImage imageNamed:im];
    cell.imageView.image = image;
    
    
    return cell;
}
@end
