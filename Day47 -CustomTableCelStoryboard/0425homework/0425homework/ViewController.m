//
//  ViewController.m
//  0425homework
//
//  Created by 李康 on 16/4/25.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSDictionary *teamfile;
@property(strong,nonatomic)NSArray *teamArray;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];
    self.teamfile = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    NSArray *tmp = [self.teamfile allKeys];
    self.teamArray = [tmp sortedArrayUsingSelector:@selector(compare:)];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString*s1=[self.teamArray objectAtIndex:section];
    NSArray *listTeams=[self.teamfile objectForKey:s1];
    return [listTeams count];
    
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    return [self.teamArray count];
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }

    NSInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *groupname = [self.teamArray objectAtIndex:section];
    NSArray *listTeams = [self.teamfile objectForKey:groupname];
    cell.textLabel.text = [listTeams objectAtIndex:row];
    
    
//    NSString *image = self.teamArray[indexPath.row][@"image"];
//    cell.imageView.image = [UIImage imageNamed:image];
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.teamArray count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *groupname = [self.teamArray objectAtIndex:section];
    return groupname;
    
    
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSMutableArray *listTitles = [[NSMutableArray alloc]initWithCapacity:[self.teamArray count]];
    for (NSString*item in self.teamArray) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
   }
    return listTitles;
   //return self.teamArray;
}

@end
