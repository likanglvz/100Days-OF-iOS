//
//  ViewController.m
//  nsThreadDemo
//
//  Created by baiheng on 16/5/19.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;

//线程锁
@property(strong)NSLock * threadLock;

@property(strong) NSCondition * condition;

//操作队列属性
@property(strong) NSOperationQueue *serialQueue1;

@property(strong) NSOperationQueue *mainQueue;

//GCD队列
@property(strong) dispatch_queue_t serielQueue;


@end

@implementation ViewController

-(void)updateProgressViewWithPercentage:(NSNumber *)percentDone
{
    //更新进度
    [self.myProgressView setProgress:[percentDone floatValue] animated:YES];
    
}

- (IBAction)signal:(id)sender {
    
    //[self.condition signal];
    
//    //串行队列
//    dispatch_queue_t q = dispatch_queue_create("nameofyourqueue", DISPATCH_QUEUE_SERIAL);
//    
//    //同步操作不创建新线程
//    dispatch_sync(q, ^{
//        NSLog(@"串行队列，同步操作 %@",[NSThread currentThread]);
//  
//    });
//    
//    //创建新线程执行block操作
//    dispatch_async(q, ^{
//        
//        NSLog(@"串行队列，异步操作 %@",[NSThread currentThread]);
//        
//    });
//    
//    
//    
//    
//    //并行队列
//    dispatch_queue_t q1 = dispatch_queue_create("name", DISPATCH_QUEUE_CONCURRENT);
//    //同步操作不创建新线程
//    dispatch_sync(q1, ^{
//        
//        NSLog(@"并行队列，同步操作 %@",[NSThread currentThread]);
//    });
//    //创新线程  执行block中任务
//    dispatch_async(q1, ^{
//        
//        NSLog(@"并行队列，异步操作 %@",[NSThread currentThread]);
//        
//    });
//    
    
//    NSLog(@"--------------------------------------");
//    
//    
//    NSLog(@"====4====");
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"====5====");
//    });
//    NSLog(@"====6====");
//    
//    
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"====1====");
//        
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"====2====");
//        });
//        NSLog(@"====3====");
//        
//    });
    
    
    //dispath group:把任务分组。
    //task1,task2,task3  完成之后，--->  task4，task5 ,task6
    
    NSLog(@"--------------------------------");
    
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建组
    dispatch_group_t queueGroup = dispatch_group_create();
    
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task1");
        
    });
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task2");
        

    });
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task3");
        
        
    });
    
    //等待组内前面提交的任务结束
    dispatch_group_wait(queueGroup, DISPATCH_TIME_FOREVER);

    queueGroup = dispatch_group_create();
    
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task4");
        
    });
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task5");
        
        
    });
    dispatch_group_async(queueGroup, aQueue, ^{
        
        NSLog(@"task6");
        
        
    });
    
    dispatch_group_notify(queueGroup, aQueue, ^{
        
        NSLog(@"task7");
        
    });
    
    

    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化线程锁
    self.threadLock = [[NSLock alloc]init];
    
    self.condition = [[NSCondition alloc]init];
    //主队列
    self.mainQueue = [NSOperationQueue mainQueue];
    //串行队列
    self.serialQueue1 = [[NSOperationQueue alloc]init];
    //最大并发操作数
    self.serialQueue1.maxConcurrentOperationCount = 1;
    
    //GCD 串行队列
    self.serielQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bigTask
{
//    for (int i=0; i<40000; i++) {
//        NSString * newString = [NSString stringWithFormat:@"i=%d",i];
//        NSLog(@"%@",newString);
//        
//    }
//    
//    [self.myActivityIndicator stopAnimating];
    
    //加锁
    //[self.threadLock lock];
    
    //@synchronized(self) {

    [self.condition lock];
    [self.condition wait];
    
    
    
    int updateUIWhen = 1000;
    for (int i=0; i<10000; i++) {
        NSString * newString = [NSString stringWithFormat:@"i=%d",i];
        NSLog(@"%@",newString);
        
        if (i==updateUIWhen) {
            float f = (float)i/10000;
            NSNumber * percentDone = [NSNumber numberWithFloat:f];
           //更新进度条
            [self performSelectorOnMainThread:@selector(updateProgressViewWithPercentage:) withObject:percentDone waitUntilDone:YES];
            

            [self updateProgressViewWithPercentage:percentDone];
            
            updateUIWhen = updateUIWhen + 1000;

        }

    }

    self.myProgressView.progress = 1.0f;
  
    [self.myActivityIndicator stopAnimating];
    
    [self.condition unlock];
    
    
    //}
    //解锁
    //[self.threadLock unlock];
    
    

}


- (IBAction)bigTaskAction:(id)sender {
  /*
    [self.myActivityIndicator startAnimating];
  //  [self bigTask];
    //创建新线程
    [NSThread detachNewThreadSelector:@selector(bigTask) toTarget:self withObject:nil];
    */
    
    
    //操作队列
    /*
    [self.myActivityIndicator startAnimating];
    
    [self.serialQueue1 addOperationWithBlock:^{
        
        int updateUIWhen = 1000;
        for (int i=0; i<10000; i++) {
            NSString * newString = [NSString stringWithFormat:@"i=%d",i];
            NSLog(@"%@",newString);
            
            if (i==updateUIWhen) {
                float f = (float)i/10000;
                NSNumber * percentDone = [NSNumber numberWithFloat:f];
                
                //更新进度条 放到主队列中
                [self.mainQueue addOperationWithBlock:^{
                    [self.myProgressView setProgress:[percentDone floatValue] animated:YES];
                    
                    
                }];
                
                
                updateUIWhen = updateUIWhen + 1000;
                
            }
            
        }
        
        [self.mainQueue addOperationWithBlock:^{
            
            self.myProgressView.progress = 1.0f;
            
            [self.myActivityIndicator stopAnimating];

        
            
        }];

        
    }];
    
 
    */
    
    //GCD
    
    //串行队列 异步操作
    [self.myActivityIndicator startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        int updateUIWhen = 1000;
        for (int i=0; i<10000; i++) {
            NSString * newString = [NSString stringWithFormat:@"i=%d",i];
            NSLog(@"%@",newString);
            
            if (i==updateUIWhen) {
                float f = (float)i/10000;
                NSNumber * percentDone = [NSNumber numberWithFloat:f];
                
                //更新进度条 放到主队列中
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mainQueue addOperationWithBlock:^{
                        [self.myProgressView setProgress:[percentDone floatValue] animated:YES];
                  
                    }];

                });
  
                updateUIWhen = updateUIWhen + 1000;
                
            }
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.myProgressView.progress = 1.0f;
            
            [self.myActivityIndicator stopAnimating];
            

        });

    });
    
    
    
    
    
    

}

@end

/*
 
  线程之间可能会共享一些资源，比如文件，内存，数据库等。当多个线程同时读写同一共享资源，可能会引起冲突。需要引入线程同步：有序的对共享资源进行访问。
 
 线程锁。互斥量。
 
 1，nslock
 2，使用synchronized进行同步
 3, nscondition
 
 
 串行队列：队列中的任务只能顺序执行。
 并行队列：队列中的任务通常并发执行。
 全局队列：是系统创建的并行队列，可以直接获取调用
 主队列：每个应用程序只有一个，串行队列，ui更新
 
 同步操作：不创建新线程。
 异步操作：创建新线程。
 
 串行队列同步操作：不创建新线程。操作顺序进行。
 串行队列异步操作：创建新线程，操作顺序进行。
 
 并行队列同步操作：不创建新线程。操作顺序进行。
 并行队列异步操作：创建新线程。操作无序进行。
 
 全局队列同步操作：
 全局队列异步操作：
 
 主队列同步操作：
 主队列异步操作：
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */







