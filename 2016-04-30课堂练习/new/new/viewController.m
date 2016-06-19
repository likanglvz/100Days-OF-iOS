//
//  FirstViewController.m
//  new
//
//  Created by 李康 on 16/4/29.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "viewController.h"
#import "DetailViewController.h"


@interface viewController ()

@property(strong,nonatomic) NSDictionary* dictData;
@property(strong,nonatomic) NSArray *listData;



@end

@implementation viewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *bun = [NSBundle mainBundle];
    NSString *path = [bun pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    UINavigationController *nav = (UINavigationController *)self.parentViewController;//获得当前视图控制器的父视图控制器
    NSString *selectedP = nav.tabBarItem.title;//获得当前的标签
    
    if ([selectedP isEqualToString:@"黑龙江"]) {
        self.listData = [self.dictData objectForKey:@"黑龙江省"];
        self.navigationItem.title = @"黑龙江省信息";
    }else if ([selectedP isEqualToString:@"吉林"]){
        self.listData = [self.dictData objectForKey:@"吉林省"];
        self.navigationItem.title = @"吉林省信息";
        
    }else{
        self.listData = [self.dictData objectForKey:@"辽宁省"];
        self.navigationItem.title = @"辽宁省信息";
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        DetailViewController * detailViewcontroller = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow]row];
        
        NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
        
        detailViewcontroller.url =[dict objectForKey:@"url"];
        detailViewcontroller.title = [dict objectForKey:@"name"];
    
        
    }
    
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dict = [self.listData objectAtIndex:[indexPath row]];
    
    cell.textLabel.text =[dict objectForKey:@"name"];
    return cell;

}












@end
