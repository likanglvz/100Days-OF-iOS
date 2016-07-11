//
//  ViewController.m
//  updownloadImage
//
//  Created by 李康 on 16/5/30.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()<NSURLSessionDelegate,NSURLSessionDownloadDelegate>
{
    
    NSURLSessionDownloadTask *download;
    NSURLSessionUploadTask *upload;
    
    
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong,nonatomic) NSURLSession *myNetworkSession;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //会话配置
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //创建网络会话,根据配置，代理和队列
    self.myNetworkSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)download:(id)sender {
    
    //url session
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.2.8/upload/aa.jpg"];
    //创建下载任务
    download = [self.myNetworkSession downloadTaskWithURL:url];
    //执行任务
    [download resume];
    
    [self.progressView setProgress:0];
  
}
//下载完毕触发，下载到临时路径，考虑把下载后的文件放到别的路径
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSArray * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString * cacheDirectory = path[0];
    
    NSLog(@"%@",cacheDirectory);
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    
    //目标文件路径
    NSURL *destinationUrl = [NSURL fileURLWithPath:[cacheDirectory stringByAppendingPathComponent:@"test.jpg"]];
    
    if ([fileManager moveItemAtURL:location toURL:destinationUrl error:&error]) {
        
        //显示图像
        
        UIImage *img = [UIImage imageWithContentsOfFile:[destinationUrl path]];
        
        self.imageView.image = img;
        
        
        
    }else{
        
        NSLog(@"%@",error);
        
    }
    
    
}

-(void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    //下载进度的计算
    double progress = (double)totalBytesWritten/(double)totalBytesExpectedToWrite;
    
    [self.progressView setProgress:progress animated:YES];
    
    
}


- (IBAction)AFdownload:(id)sender {
    
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    
    NSURL *url =[NSURL URLWithString:@"http://192.168.2.8/upload/aa.jpg"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:5.0f];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //此block返回下载文件存放位置
        
        NSArray * documentDirectory = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        
        NSLog(@"%@",[documentDirectory[0] URLByAppendingPathComponent:[response suggestedFilename]]);
        
        
        //追加文件名的完成路径
        return [documentDirectory[0] URLByAppendingPathComponent:[response suggestedFilename]];
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {//请求完毕。显示图像
        
        NSLog(@"file download to %@",filePath);
        
        //显示图像
        
        UIImage *img = [UIImage imageWithContentsOfFile:[filePath path]];
        
        self.imageView.image = img;
        
    }];
    
    [task resume];
    

    
}


- (IBAction)up:(id)sender {
    
    //url session
    
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"8878" ofType:@"JPG"];
    
    NSString *path = [[NSString alloc]initWithFormat:@"http://192.168.2.8/upload_file.php"];
    
    NSURL *url = [NSURL URLWithString:path];
    //分隔符
    NSString *boundary = @"9125eqfoiewh";
    
    NSMutableData *body = [NSMutableData data];
    //指定接受类型等
    NSDictionary *thisFile = @{@"filepath":filepath,
                               @"name":@"file",
                               @"mimetype":@"image/jpeg"
                 
                               };
    
    
    NSString *thisFiledString = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\";filename=\"%@\"\r\nContent-Type: %@\r\nContent-Transfer-Encoding: binary\r\n\r\n",boundary,thisFile[@"name"],[thisFile[@"filepath"] lastPathComponent],thisFile[@"mimetype"]];
    
    //请求体追加数据
    [body appendData:[thisFiledString dataUsingEncoding:NSUTF8StringEncoding]];
    
    //图像数据文件
    [body appendData:[NSData dataWithContentsOfFile:thisFile[@"filepath"]]];
    
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:5.0];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:[NSString stringWithFormat:@"multipart/form-data;charset=%@;boundary=%@",@"utf-8",boundary] forHTTPHeaderField:@"Content-Type"];
    
    //请求头，内容长度
    [request setValue:[NSString stringWithFormat:@"%lu",[body length]] forHTTPHeaderField:@"Content-Length"];
    
    [request setHTTPBody:body];
    
    
    
//    //建立会话，执行任务
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    
//    NSURLSessionTask *task =[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        //打印服务器响应
//        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"%@",str);
//        
//    }];
//    
//    
//    
//    [task resume];
    


    upload = [self.myNetworkSession uploadTaskWithRequest:request fromData:body completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",str);
 
    }];

    [upload resume];
    
    
    
    
}
- (IBAction)afupload:(id)sender {
    
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"8879" ofType:@"JPG"];
    
    NSString *path = [[NSString alloc]initWithFormat:@"http://192.168.2.8/upload_file.php"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //读图像文件
        NSData *imageData = [NSData dataWithContentsOfFile:filepath];
        //构造表单数据
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"8879.JPG" mimeType:@"image/jpeg"];
    
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",str);
        

        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        
    }];
    
    

    
    
    
    
    
}

@end
