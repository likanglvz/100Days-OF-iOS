//
//  ViewController.m
//  editTableView
//
//  Created by 李康 on 16/4/26.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UINavigationItem *myNavigationItem;
@property (strong,nonatomic) NSMutableArray *myArray;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //导航条右按钮  设置成编辑按钮
    self.myNavigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.myArray = [[NSMutableArray alloc]initWithObjects:@"河南",@"河北",@"江苏", nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//uiviewController的方法  用于响应视图编辑状态的变化
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    if (editing) {
        self.textField.hidden=NO;
        
    }else{
        self.textField.hidden=YES;
    }
 
}
//编辑时触发
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //如果编辑类型为删除
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //删除数据源中对应的元素
        [self.myArray removeObjectAtIndex:indexPath.row];
        //删除对应行
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }else if (editingStyle==UITableViewCellEditingStyleInsert){
        [self.myArray insertObject:self.textField.text atIndex:[self.myArray count]];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==[self.myArray count]) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}







#pragma  mark -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myArray count]+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    //用于判断是否为新增加的一行
    BOOL addCell = (indexPath.row == self.myArray.count);
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (!addCell) {//如果不是新增加的单元格，显示其中的内容
        cell.textLabel.text=self.myArray[indexPath.row];
    }else{//新增加的单元格，放置文本框，用于输入
        self.textField.frame = CGRectMake(10, 0, 300, 44);
        self.textField.text = @"";
        [cell.contentView addSubview:self.textField];
        
    }
    
    
    return cell;
  
    
}



@end
