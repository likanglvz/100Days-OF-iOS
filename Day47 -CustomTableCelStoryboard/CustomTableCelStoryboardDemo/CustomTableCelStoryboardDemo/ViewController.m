//
//  ViewController.m
//  CustomTableCelStoryboardDemo
//
//  Created by 李康 on 16/4/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "NameAndGenderCell.h"

static NSString * identifier = @"Cell";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray * students;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.students = @[@{@"姓名":@"陈放",@"性别":@"男"},
                      @{@"姓名":@"陈兆江",@"性别":@"男"},
                      @{@"姓名":@"何亚南",@"性别":@"女"},
                      @{@"姓名":@"李琴",@"性别":@"女"}
                      ];
    
    
    self.tableView.rowHeight = 65;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.students count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    NameAndGenderCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //NameAndGenderCell *cell = [[NameAndGenderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    NSString *s=[self.students[indexPath.row] objectForKey:@"姓名"];
    NSString *s2=[self.students[indexPath.row] objectForKey:@"性别"];
    cell.nameLabel.text=s;
    cell.genderLabel.text=s2;
    // cell.accessoryType=UITableViewCellAccessoryDetailButton;
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertAction *choice =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    NSString *s=[self.students[indexPath.row] objectForKey:@"姓名"];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"你确定要打死他吗？" message:s preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:choice];
    [self presentViewController:controller animated:YES completion:nil];
    
    //    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"选中的行信息" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //    [alter show];
    
    
    
}






@end
