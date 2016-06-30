//
//  ViewController.m
//  requestEx
//
//  Created by 李康 on 16/5/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "MKNetworkKit.h"
#import "AFNetworking.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *fullname;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)post:(id)sender {
    //session  post 上传

    
    NSDictionary *dic = @{@"UserName":self.username.text,
                          @"FullName":self.fullname.text
                                };
    
    
    NSMutableURLRequest *request  =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://192.168.2.8/webservice3.php"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0f];
    
    
    NSError *parseError = nil;

     NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    [request setHTTPMethod:@"POST"];

    
    [request setHTTPBody:jsonData];
    //创建网络会话
    NSURLSession *session = [NSURLSession sharedSession];

    
    
    NSURLSessionTask *task =[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"ddd");
    }];
    
    
    
    [task resume];

    
   
    
}
- (IBAction)mkpost:(id)sender {
    
    
    //mk
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    
    
    
    
    NSString *path = @"/webservice3.php";
    //以主机名来初始化host对象
    MKNetworkHost *host = [[MKNetworkHost alloc]initWithHostName:@"192.168.2.8"];
    //初始化请求对象
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@2 forKey:@"user"];
    [param setObject:@10 forKey:@"number"];
    [param setObject:@"json" forKey:@"format"];
    
    NSDictionary *dic = @{@"UserName":self.username.text,
                          @"FullName":self.fullname.text
                          };
    
    NSError *parseError = nil;
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    MKNetworkRequest *request = [host requestWithPath:path params:param httpMethod:@"POST" body:jsonData ssl:NO];
  
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        
        if (completedRequest.error) {
            
            NSLog(@"error是%@",completedRequest.error);
            
        }else{
            //打印到控制台
            NSLog(@"yes");
            
        }
     
    }];
    
    [host startRequest:request];

}

- (IBAction)afpost:(id)sender {
    
    /*
     NSMutableURLRequest *request  =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://192.168.2.8/webservice3.php"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0f];
    
    
    
   
    
    NSDictionary *dic = @{@"UserName":self.username.text,
                          @"FullName":self.fullname.text
                          };
    
    
    
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@2 forKey:@"user"];
    [param setObject:@10 forKey:@"number"];
    [param setObject:@"json" forKey:@"format"];
    NSError *parseError = nil;
    
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:jsonData];
    
    //post请求
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"error = %@",error);
        
    }];
    
    [op start];
     */
    
    /*
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.2.8/webservice3.php"];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"UserName"]=self.username.text;
    dict[@"FullName"]=self.fullname.text;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:@"http://192.168.2.8/webservice3.php" parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",string);
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        
        NSLog(@"%@",error);
        
    }];
    */
    
    
    //会话设置
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //初始化http会话管理器
    AFHTTPSessionManager *manager1 = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:configuration];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"UserName"]=self.username.text;
    dict[@"FullName"]=self.fullname.text;
    
    [manager1 POST:@"http://192.168.2.8/webservice3.php" parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",string);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
         NSLog(@"%@",error);
        
    }];
    
    
    
    
    
    
    
}
- (IBAction)sessionDownload:(id)sender {
    
    NSMutableURLRequest *request  =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://192.168.2.8/webservice11.php"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0f];
    
    NSString *post = [NSString stringWithFormat:@"user=%d&format=%@",1,@"xml"];
    
    NSData *posyData = [post dataUsingEncoding:NSUTF8StringEncoding];

    
    
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:posyData];
    
    NSURLSession *session = [NSURLSession sharedSession];

//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if (error) {
//            NSLog(@"error = %@",error);
//        }else{
//            NSLog(@"%@",response);
//            
//        }
//    
//    }];
//
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@",error);
        }
        else{
            //将返回的数据打印到控制台
            NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataString);
            
        }
        
        
    }];
    
    
    
    [task resume];
  
    
}
- (IBAction)sessionget:(id)sender {
    
    NSString *strURL = @"http://192.168.2.8/webservice1.php?user=1&format=xml";
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
       
        }
        
    }];
    
    //执行任务
    [task resume];

    
}
- (IBAction)mkget:(id)sender {
    
    
    NSString *path = @"webservice1.php?user=1&format=xml";
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
            
        }
        
        
        
    }];
    
    [host startRequest:request];
    

    
    
    
    
    
    
}



- (IBAction)afget:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //af get
    
    [manager GET:@"http://192.168.2.8/webservice1.php?user=1&format=xml" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //响应的解析器，默认的是AFHTTPResponseSerializer
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        NSString *resposeString =[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",resposeString);
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
 
    
}
- (IBAction)synget:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.2.8/webservice1.php?user=1&format=json"];
    
    __block NSURL *location;
    __block NSError *error;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionTask *downtask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable l, NSURLResponse * _Nullable r, NSError * _Nullable e) {
        
        location = l;
        error = e;
        //信号量加1
        dispatch_semaphore_signal(semaphore);
    
    }];
    
    [downtask resume];
    
    double timeoutInSecond = 2.0;
    //gcd 时间 2秒
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, (int64_t)timeoutInSecond * NSEC_PER_SEC);
    
    //在限定时间内等待signal
    long timeoutResult = dispatch_semaphore_wait(semaphore, timeout);
    
    NSLog(@"%@",location);
    
}


@end
