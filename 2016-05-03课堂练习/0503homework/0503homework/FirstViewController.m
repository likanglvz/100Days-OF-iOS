//
//  ViewController.m
//  0503homework
//
//  Created by 李康 on 16/5/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property(strong,nonatomic) NSDictionary* dictData;
@property(strong,nonatomic) NSArray *listData;

@end

@implementation FirstViewController
-(id)initWith:(NSString *)s{
    NSBundle *bun = [NSBundle mainBundle];
    NSString *path = [bun pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:path];

    
        if ([s isEqualToString:@"黑龙江"]) {
             self.title =s;
            self.listData = [self.dictData objectForKey:@"黑龙江省"];
            //self.navigationItem.title = @"黑龙江省信息";
            self.tabBarItem.image = [UIImage imageNamed:@"hei"];
            //self.nav = [[UINavigationItem alloc]initWithTitle: @"黑龙江省信息"];
            
        }else if ([s isEqualToString:@"吉林"]){
             self.title =s;
            self.listData = [self.dictData objectForKey:@"吉林省"];
             self.tabBarItem.image = [UIImage imageNamed:@"Ji"];
           // self.nav = [[UINavigationItem alloc]initWithTitle: @"吉林省信息"];
        }else{
             self.title =s;
            self.listData = [self.dictData objectForKey:@"辽宁省"];
             self.tabBarItem.image = [UIImage imageNamed:@"Liao"];
           // self.nav = [[UINavigationItem alloc]initWithTitle: @"辽宁省信息"];
        }

    self.tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height);
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listData count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //self.tableView.frame.origin.y=50;
    
    
    NSDictionary *dict = [self.listData objectAtIndex:[indexPath row]];
    
    cell.textLabel.text =[dict objectForKey:@"name"];
    return cell;
    
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    SecondViewController * second = segue.destinationViewController;
//    
//    NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow]row];
//    
//    NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
//    
//    second.url =[dict objectForKey:@"url"];
//    second.title = [dict objectForKey:@"name"];
//
//    
//    
//    
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController * second = [[SecondViewController alloc]initWithNibName:nil bundle:nil];
    
    NSDictionary *dict = [self.listData objectAtIndex:indexPath.row];
    
    second.url =[dict objectForKey:@"url"];
    second.title = [dict objectForKey:@"name"];
    
    [self.navigationController pushViewController:second animated:YES];
    
    
}
















@end
