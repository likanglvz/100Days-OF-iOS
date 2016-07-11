//
//  ViewController.m
//  NSThread
//
//  Created by 李康 on 16/5/19.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myAcitivtyIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
//线程🔒
@property (strong)NSLock *threadLock;


@property(strong) NSCondition *condition;

@end

@implementation ViewController
- (IBAction)signal:(id)sender {
    [self.condition signal];
}

-(void)updateProgressViewWithPercentage:(NSNumber *)percentDone{
    //更新进度
    [self.myProgressView setProgress:[percentDone floatValue] animated:YES];
    
    
    
    
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化线程🔒
    self.threadLock = [[NSLock alloc]init];
    
    self.condition = [[NSCondition alloc]init];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bigTask{

    //[self.threadLock lock];
    
   // @synchronized (self) {
    
    [self.condition lock];
    //[self.condition wait];
    
        int updateUIWhen = 1000;
        for (int i = 0 ; i<10000; i++) {
            
            NSString *newString = [NSString stringWithFormat:@"i=%d",i];
            NSLog(@"%@",newString);
            
            if (i == updateUIWhen) {
                float f = (float)i/10000;
                NSNumber *percentDone = [NSNumber numberWithFloat:f];
                
                //更新进度条
                [self performSelectorOnMainThread:@selector(updateProgressViewWithPercentage:) withObject:percentDone waitUntilDone:YES];
                
                updateUIWhen +=1000;
                
                
            }
            
        }
        self.myProgressView.progress = 1.0f;
        
        
        [self.myAcitivtyIndicator stopAnimating];
   // }
    
    
    
    //解🔒
    //[self.threadLock unlock];
    
    
    [self.condition unlock];

}


- (IBAction)bigTaskAction:(id)sender {
    
    [self.myAcitivtyIndicator startAnimating];
    //[self bigTask];
    //创建新线程
    [NSThread detachNewThreadSelector:@selector(bigTask) toTarget:self withObject:nil];
    
    
    
    
    
    
    
    
}

@end

/*
 线程之间可能会共享一些资源，比如文件，内存，数据库等。当多个线程同时读写同一个共享资源，可能会引起冲突。需要引入同步线程：有序的对共享资源进行访问。
 
 线程锁：互斥量。
 
 1 nslock
 
 2 使用synchronized进行同步
 
 3 nscondition
 
 
 
 */






