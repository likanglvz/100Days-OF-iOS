//
//  ViewController.m
//  webviewJS
//
//  Created by baiheng on 16/5/29.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.2.8/demo.html"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2.0];
    
    [_myWebView loadRequest:request];
    _myWebView.delegate = self;
    [self.view addSubview:_myWebView];
    
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSMutableString *js = [NSMutableString string];
   
    [js appendString:@"document.write('<h4>Hello javaScript!</h4>');document.write('<h2>Hello javaScript!</h2>'); document.write('<h3>Hello javaScript!</h3>');"];
    
    [self.myWebView stringByEvaluatingJavaScriptFromString:js];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
