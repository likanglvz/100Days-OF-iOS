//
//  TableViewController.m
//  httpRequestDemo
//
//  Created by 李康 on 16/5/26.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "TableViewController.h"
#import "MKNetworkKit.h"
#import "AFNetworking.h"
@interface TableViewController ()

@property(nonatomic,strong) NSMutableArray *notes;



@end

@implementation TableViewController

-(void)startRequest{
    
    NSString *strURL = @"http://192.168.2.8/note2.json";
    //url请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:strURL]];
    //url connection同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    [self reloadView:resDict];
    
}
-(void)reloadView:(NSDictionary *)res{
    
    //假设约定ResultCode键对应的值为服务器返回的状态码
    NSNumber *resultCodeObj = res[@"ResultCode"];
    if ([resultCodeObj intValue]==0) {
        self.notes = res[@"Record"];
        [self.tableView reloadData];
    }
    else{
        
        //错误处理,比如弹出警告框
        
    }
    
}
-(void)startRequest2{
    //nsurl session get request
    
    NSString *strURL = @"http://192.168.2.8/note2.json";
    NSURL *url = [NSURL URLWithString:strURL];
    //get请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:2.0f];
    //创建网络会话
    NSURLSession *session = [NSURLSession sharedSession];
    //构建会话任务
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
        }
         else{
            //将返回的数据打印到控制台
            NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataString);
            
            //json数据解析
            NSError *error1;
            id resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
            
            if (error1) {
                NSLog(@"%@",error1);
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                     [self reloadView:resDict];
                });
             
            }
            
            
        }
        
    }];
    
    //执行任务
    [task resume];
  
}
-(void)startRequest3{
    
    //url session post
    
    NSString *strURl = [NSString stringWithFormat: @"http://192.168.2.8/note2.json"];
    
    NSURL *url = [NSURL URLWithString:strURl];
    
    NSString *post = [NSString stringWithFormat:@"user=%d&num=%d&format=%@",2,10,@"xml"];
    
    NSData *posyData = [post dataUsingEncoding:NSUTF8StringEncoding];
    //建立post请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:2.0f];
   //指定请求方法为post
    [request setHTTPMethod:@"POST"];
    //请求体
    [request setHTTPBody:posyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"%@",error);
        }
        else{
            //将返回的数据打印到控制台
            NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataString);
            
            //json数据解析
            NSError *error1;
            id resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error1];
            
            if (error1) {
                NSLog(@"%@",error1);
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self reloadView:resDict];
                });
                
            }
            
            
        }

 
    }];
    [task resume];
    
    
}


-(void)startRequest4{
    //mknetwork  get
    
    //不包括主机名的地址
    NSString *path = @"note2.json";
    //以主机名来初始化host对象
    MKNetworkHost *host = [[MKNetworkHost alloc]initWithHostName:@"192.168.2.8"];
    //初始化请求对象
    MKNetworkRequest *request = [host requestWithPath:path params:nil httpMethod:@"GET"];
    
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        
        if (completedRequest.error) {
           
            NSLog(@"error");
            
        }else{
            //打印到控制台
            NSLog(@"%@",[completedRequest responseAsString]);
            
            NSData *data = [completedRequest responseData];
            
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{

            [self reloadView:resDict];
        
            });
        }
        
        
        
    }];
    
    [host startRequest:request];

    
}

-(void)startRequest5{
    
    
    
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    
    
    
    //mknetwork kit post
    //不包括主机名的地址
    NSString *path = @"/note2.json";
    //以主机名来初始化host对象
    MKNetworkHost *host = [[MKNetworkHost alloc]initWithHostName:@"192.168.2.8"];
    //初始化请求对象
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@2 forKey:@"user"];
    [param setObject:@10 forKey:@"number"];
    [param setObject:@"xml" forKey:@"format"];
    
    
    
    MKNetworkRequest *request = [host requestWithPath:path params:param httpMethod:@"POST"];
    
    
    
    
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        
        if (completedRequest.error) {
            
            NSLog(@"error是%@",completedRequest.error);
            
        }else{
            //打印到控制台
            NSLog(@"%@",[completedRequest responseAsString]);
            
            NSData *data = [completedRequest responseData];
            
            NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
           // dispatch_async(dispatch_get_main_queue(), ^{
                
                [self reloadView:resDict];
            
           
            
            
            //});
        }
        
        
        
    }];
    
    [host startRequest:request];
   
}


-(void)startRequest6{
    //afnetwork http请求操作管理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //af get
    
    [manager GET:@"http://192.168.2.8/note2.json" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [self reloadView:responseObject];
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
  
    
}

-(void)startRequest7{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *param = @{@"user":@"bai",
                            @"format":@"json",
                            };
    //post请求
    [manager POST:@"http://192.168.2.8/note2.json" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [self reloadView:responseObject];
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];

    
    
    
    
    
    
    
    
    
    
}







-(void)removeCache
{
    //===============清除缓存==============
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    //    NSLog(@"文件数 ：%d",[files count]);
    for (NSString *p in files)
    {
        NSError *error;
        NSString *path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self removeCache];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //[self startRequest];
    
    //[self startRequest2];
    
    //[self startRequest3];
    
    //[self startRequest4];

     //[self startRequest5];
    
    //[self startRequest6];
    
    [self startRequest7];


    
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
    NSMutableDictionary *dict = self.notes[indexPath.row];
    
    
    cell.textLabel.text =[dict objectForKey:@"Content"];
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
