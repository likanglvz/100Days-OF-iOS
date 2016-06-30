//
//  TableViewController.m
//  xmlHomework
//
//  Created by baiheng on 16/5/25.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "TableViewController.h"
#import "TBXML.h"


@interface TableViewController ()

@property(strong,nonatomic)NSMutableArray * notes;
@property(strong,nonatomic) NSString * currentTagName;



@end

@implementation TableViewController

-(void)start
{
    NSString * path;
    NSURL * url;
    
    path = [[NSBundle mainBundle]pathForResource:@"note2" ofType:@"xml"];
    url = [NSURL fileURLWithPath:path];
    
    NSXMLParser * parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    
    parser.delegate = self;
    [parser parse];
    
    
}

-(void)start2
{
    self.notes = [NSMutableArray array];
    TBXML * tbxml = [[TBXML alloc]initWithXMLFile:@"note2.xml" error:nil];
    TBXMLElement * root = tbxml.rootXMLElement;
    if (root) {
        
        TBXMLElement * noteElement = [TBXML childElementNamed:@"Note" parentElement:root];
        
        //在note元素上循环，取出各个note元素中各子元素（包括属性）放入字典
        while (noteElement !=nil) {
            
            NSMutableDictionary * dict = [NSMutableDictionary dictionary];
            
            TBXMLElement * CDateElement = [TBXML childElementNamed:@"CDate" parentElement:noteElement];
            
            if (CDateElement != nil) {
                NSString * cdate = [TBXML textForElement:CDateElement];
                [dict setValue:cdate forKey:@"CDate"];
                
            }
            
            
            TBXMLElement * contentElement = [TBXML childElementNamed:@"Content" parentElement:noteElement];
            
            if (contentElement != nil) {
                NSString * content = [TBXML textForElement:contentElement];
                [dict setValue:content forKey:@"Content"];
                
            }

            TBXMLElement * userIDElement = [TBXML childElementNamed:@"UserID" parentElement:noteElement];
            
            if (userIDElement != nil) {
                NSString * userid = [TBXML textForElement:userIDElement];
                [dict setValue:userid forKey:@"UserID"];
                
            }
            
            
            
            NSString * _id = [TBXML valueOfAttributeNamed:@"id" forElement:noteElement];
            
            [dict setValue:_id forKey:@"id"];
            
            
            [self.notes addObject:dict];
            
            //查找下一个兄弟元素
            noteElement = [TBXML nextSiblingNamed:@"Note" searchFromElement:noteElement];
            
            
            
        }
        
        
    }
    
}


-(void)start3
{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"note2" ofType:@"json"];
    
    NSData * jsonData = [[NSData alloc]initWithContentsOfFile:path];
    
    NSError * error;
    //json解析
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"%@",error);
        return;
        
    }
    
    self.notes = [jsonObj objectForKey:@"Record"];
    
    
}

-(void)writeJsonData
{//从objective c对象转为json格式文档，存入沙盒路径document路径，data.json
    NSDictionary * dict = @{@"ResultCode":@0,@"Record":self.notes};
    NSError * error;
    //从foundation对象到json数据
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    
    //写入文件
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docmunent = paths[0];
    NSString * wholePath = [docmunent stringByAppendingPathComponent:@"data.json"];
    NSLog(@"%@",wholePath);
    [data writeToFile:wholePath atomically:YES];

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
   // [self start];
   // [self start2];
    
    
    [self start3];
    [self writeJsonData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - xml parser

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    //初始化数组
    self.notes = [NSMutableArray array];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    //记录当前标签
    self.currentTagName = elementName;
    //如果标签是Note
    if ([self.currentTagName isEqualToString:@"Note"]) {
        //取标签属性的值
        NSString * _id = [attributeDict objectForKey:@"id"];
        
        //将一个可变字典对象放入数组，字典中现有属性键值对
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        [dict setObject:_id forKey:@"id"];
        [self.notes addObject:dict];
        
        
    }
    
    
    
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    //遇到字符串，判断标签，然后在可变字典中添加了键值对
    
    NSMutableDictionary * dict = [self.notes lastObject];
    
    if ([self.currentTagName isEqualToString:@"CDate"]) {
        [dict setObject:string forKey:@"CDate"];
        
    }
    if ([self.currentTagName isEqualToString:@"Content"]) {
        [dict setObject:string forKey:@"Content"];
        
    }
    if ([self.currentTagName isEqualToString:@"UserID"]) {
        [dict setObject:string forKey:@"UserID"];
        
    }
    
    
    
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //当前标签结束
    self.currentTagName = nil;
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSMutableDictionary * dict = self.notes[indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"Content"];
    cell.detailTextLabel.text = [dict objectForKey:@"UserID"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
