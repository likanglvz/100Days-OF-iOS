//
//  ViewController.m
//  customCellNib
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "NameAndGenderCell.h"

static NSString * CelltableIdentifier = @"Cell";
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *students;
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
    
    UINib *nib =[UINib nibWithNibName:@"NameAndGenderCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:CelltableIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - tableview datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.students count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    NameAndGenderCell *cell =[tableView dequeueReusableCellWithIdentifier:CelltableIdentifier forIndexPath:indexPath];
    //NameAndGenderCell *cell = [[NameAndGenderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    NSString *s=[self.students[indexPath.row] objectForKey:@"姓名"];
    NSString *s2=[self.students[indexPath.row] objectForKey:@"性别"];
    cell.name=s;
    cell.gender=s2;
    // cell.accessoryType=UITableViewCellAccessoryDetailButton;
    
    
    
    return cell;
}

@end
