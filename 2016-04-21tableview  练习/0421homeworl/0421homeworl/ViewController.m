//
//  ViewController.m
//  0421homeworl
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistpath = [bundle pathForResource:@"team" ofType:@"plist"];
    
    self.arr = [[NSArray alloc]initWithContentsOfFile:plistpath];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - tableview datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arr count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString*simpleTableCellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableCellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableCellIdentifier];
    }
    NSString* nam=[[self.arr[indexPath.row] objectForKey:@"name"] substringFromIndex:3];
    NSString *info = [[self.arr[indexPath.row] objectForKey:@"name"] substringToIndex:2];
    
    cell.textLabel.text=nam;
    cell.detailTextLabel.text = info;
    
    
    NSString *im = [self.arr[indexPath.row] objectForKey:@"image"];
    
    UIImage *image = [UIImage imageNamed:im];
    cell.imageView.image = image;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertAction *choice =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    NSString* nam=[[self.arr[indexPath.row] objectForKey:@"name"] substringFromIndex:3];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"您所选的%@我们没有获取到版权，正在努力中。。。",nam] message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:choice];
    [self presentViewController:controller animated:YES completion:nil];
    
    
}

@end
