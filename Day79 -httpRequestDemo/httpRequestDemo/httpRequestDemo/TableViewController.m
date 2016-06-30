//
//  TableViewController.m
//  httpRequestDemo
//
//  Created by baiheng on 16/5/26.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "TableViewController.h"
#import "MKNetworkKit.h"




@interface TableViewController ()

@property(strong,nonatomic) NSMutableArray * notes;


@end

@implementation TableViewController

-(void)startRequest
{
    NSString * strURL = @"http://192.168.2.8/note21.json";
    NSURL * url = [NSURL URLWithString:strURL];
    
    //url请求
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
    //urlconnection同步请求
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary * resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    [self reloadView:resDict];
    

}

-(void)reloadView:(NSDictionary *)res
{
    //假设约定ResultCode键对应的值为服务器返回的状态码
    NSNumber * resultCodeObj = res[@"ResultCode"];
    if ([resultCodeObj intValue] == 0) {
        self.notes = res[@"Record"];
        [self.tableView reloadData];
        
        
    }else{
//错误处理，比如弹出警告框。
    }
    
    
}

-(void)startRequest2
{//nsurlsession get request
    NSString * strURL = @"http://192.168.2.8/note21.json";
    
    NSURL * url = [NSURL URLWithString:strURL];
    //get请求
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0f];
    
    //创建网络会话
    NSURLSession * session = [NSURLSession sharedSession];
    
    //构建会话任务
    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"%@",error);
        }else
        {
            //将返回对数据打印到控制台
            NSString * dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataString);
            
            NSError * error1;
            //json数据解析
            id resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
            if (error1) {//解析失败
                NSLog(@"%@",error1);
            }else//解析成功
            {
                [self reloadView:resDict];
                
            }
            
            
            
        }

    }];
    
    //执行任务
    [task resume];
    
    
}

-(void)startRequest3
{//urlsession post
    //地址
    NSString * strURL = [NSString stringWithFormat:@"http://192.168.2.8/note21.json"];
    
    NSURL * url = [NSURL URLWithString:strURL];
    //模拟请求参数
    NSString * post = [NSString stringWithFormat:@"user=%d&num=%d&format=%@",2,10,@"xml"];
    
    
    NSData * postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    //建立post请求
    NSMutableURLRequest * request =  [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0];
    //指定请求方法为POST
    [request setHTTPMethod:@"POST"];
    //请求体
    [request setHTTPBody:postData];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
        }else
        {
            //将返回对数据打印到控制台
            NSString * dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataString);
            
            NSError * error1;
            //json数据解析
            id resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
            if (error1) {//解析失败
                NSLog(@"%@",error1);
            }else//解析成功
            {
                [self reloadView:resDict];
                
            }
            
            
            
        }

        
    }];
    
    [task resume];
    
    
    
}

-(void)startRequest4
{//mknetworkkit
    //不包括主机名的地址
    NSString * path = @"note21.json";
    
    //用主机名初始化host对象
    MKNetworkHost * host = [[MKNetworkHost alloc]initWithHostName:@"192.168.2.8"];
    //初始化请求对象
    MKNetworkRequest * request = [host requestWithPath:path params:nil httpMethod:@"GET"];
    
    
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        if (completedRequest.error) {
            NSLog(@"error");
        }else
        {
            //打印响应到控制台
            NSLog(@"%@",[completedRequest responseAsString]);
            
            NSData * data = [completedRequest responseData];
            NSDictionary * resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            [self reloadView:resDict];
            
            
        }
        
        
    }];
    //执行请求
    
    [host startRequest:request];
    
    
}
-(void)startRequest5
{//mknetworkkit post
    
    //不包括主机名的地址
    NSString * path = @"note21.json";
    
    //用主机名初始化host对象
    MKNetworkHost * host = [[MKNetworkHost alloc]initWithHostName:@"192.168.2.8"];
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    [param setObject:@2 forKey:@"user"];
    [param setObject:@10 forKey:@"num"];
    [param setObject:@"xml" forKey:@"format"];
    //初始化请求对象
    MKNetworkRequest * request = [host requestWithPath:path params:param httpMethod:@"POST"];
    

    
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        if (completedRequest.error) {
            NSLog(@"error");
        }else
        {
            //打印响应到控制台
            NSLog(@"%@",[completedRequest responseAsString]);
            
            NSData * data = [completedRequest responseData];
            NSDictionary * resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            [self reloadView:resDict];
            
            
        }
        
        
    }];
    //执行请求
    
    [host startRequest:request];


    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //[self startRequest];
    
   // [self startRequest2];
    [self startRequest3];
   // [self startRequest4];
   // [self startRequest5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.detailTextLabel.text = [dict objectForKey:@"CDate"];
    
    
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
