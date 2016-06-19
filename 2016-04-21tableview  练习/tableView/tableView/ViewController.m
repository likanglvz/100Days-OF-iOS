//
//  ViewController.m
//  tableView
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)NSArray *actors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.actors=@[@"林志玲",@"赵薇",@"巩俐",@"章子怡",@"林心如",@"王宝强",@"周润发",@"林志玲",@"赵薇",@"巩俐",@"章子怡",@"林心如",@"王宝强",@"周润发",@"林志玲",@"赵薇",@"巩俐",@"章子怡",@"林心如",@"王宝强",@"周润发",@"林志玲",@"赵薇",@"巩俐",@"章子怡",@"林心如",@"王宝强",@"周润发"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma  mark - tableview datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.actors count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString*simpleTableCellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableCellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableCellIdentifier];
    }
    cell.textLabel.text=self.actors[indexPath.row];
    cell.detailTextLabel.text=@"我是你大爷";
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertAction *choice =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    NSString*str=[NSString stringWithFormat:@"您选择了%@",self.actors[indexPath.row]];
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"行信息" message:str preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:choice];
   [self presentViewController:controller animated:YES completion:nil];
    
//    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"选中的行信息" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alter show];
    
    
    
}

@end
