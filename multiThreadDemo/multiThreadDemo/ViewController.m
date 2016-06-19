//
//  ViewController.m
//  multiThreadDemo
//
//  Created by 李康 on 16/5/20.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@end

@implementation ViewController

//模拟取数据
-(NSString *)fetchSomethingFromserver{
    
    [NSThread sleepForTimeInterval:1];
    return @"Hi,I Fuck You eee!";
  
    
}
//模拟处理数据
-(NSString *)processData:(NSString *)data{
    
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}
//模拟计算结果1
-(NSString *)calculateFirstResult:(NSString *)data{
    
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of chars: %lu",(unsigned long)[data length]];
    
}
//模拟计算结果2
-(NSString *)calculateSecondResult:(NSString *)data{
    
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"e" withString:@"E"];
    
}
- (IBAction)doWork:(id)sender {
    
    __block NSString *str;
    
    self.resultTextView.text = @"";
    //开始时间
    
    self.startButton.enabled = NO;
    
   
    NSDate *startTime = [NSDate date];
         
 
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
     [self.spinner startAnimating];
    
    dispatch_async(queue, ^{
        
        NSString *fetchedData = [self fetchSomethingFromserver];
        
        NSString *processedData = [self processData:fetchedData];
        
        __block NSString * firstResult;
        __block NSString * secondResult;
        
        
    //创建组
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_group_async(group, queue, ^{
             firstResult = [self calculateFirstResult:processedData];
          

        });
        dispatch_group_async(group, queue, ^{
            secondResult = [self calculateSecondResult:processedData];
            
        });
        
        //组里任务结束后才会执行这个块中的任务
//        dispatch_group_notify(group, queue, ^{
//            
//            
//        });
        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        

        NSString *resultSummary = [NSString stringWithFormat:@"First:%@\nsecond:%@",firstResult,secondResult];
        
        str = resultSummary;
        //结束时间
        NSDate *endTime = [NSDate date];
        
        
        
        NSLog(@"completed time %f",[endTime timeIntervalSinceDate:startTime]);
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.resultTextView.text = str;
            
            [self.spinner stopAnimating];
            self.startButton.enabled = YES;
        
        
        
    });
    
    
    });

    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
