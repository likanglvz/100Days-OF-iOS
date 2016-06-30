//
//  ViewController.m
//  GCD和COREDATA的联合使用
//
//  Created by 李康 on 16/5/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "Persistence.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong) Persistence* persistence;
@property(nonatomic,strong) NSManagedObjectContext * managedObjectContext;



@end

@implementation ViewController

//故事板一加载，此方法会自动调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        //core data初始化
        
    
        self.persistence = [[Persistence alloc]init];
        
        self.managedObjectContext = [self.persistence createManagedObjectContext];
        

    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)writeData{
    NSManagedObjectContext *constext = [self.persistence createManagedObjectContext];
    
    NSLog(@"writing");
    
    for (int i =0; i<10000; i++) {
        NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:@"MyData" inManagedObjectContext:constext];
        
        [obj setValue:@(i) forKey:@"myValue"];
  
        
        NSError *error ;
        [constext save:&error];
        
        if (error) {
            NSLog(@"writing error %@",error);
        }
        
    }
    
    
    NSLog(@"写入完毕");
    
}


//从所有托管对象中提取出的百分比
-(CGFloat)reportStatus{
    
    NSManagedObjectContext *constext = self.managedObjectContext;
    //创建提取请求
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:@"MyData" inManagedObjectContext:constext];

    NSError *error;
    //提取对象的数量
    NSInteger count = [constext countForFetchRequest:request error:&error];
    if (error) {
        NSLog(@"reading error %@",error);
    }
    //返回提取对象的百分比
    return (CGFloat)count/10000.0f;
    
}


-(void)viewDidAppear:(BOOL)animated{
    //调用读写方法
    
    [super viewDidAppear:animated];
    
    //读写在各自的线程中，并发执行 
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self writeData];

    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    CGFloat status = 0;
    while (status<1.0) {
        status = [self reportStatus];
        
        
        //进度条和label显示
        dispatch_async(dispatch_get_main_queue(), ^{
            self.label.text = [NSString stringWithFormat:@"%lu%%",(unsigned long)(status *100)];
            
            [self.progressView setProgress:status animated:YES];
            
   
        });
        
     
        
        NSLog(@"status : %lu%%",(unsigned long)(status *100));
    
    }
        
        NSLog(@"All Done");
       
       
   });
    
    //core data 使用多线程 要给每一个线程一个托管对象上下文。
    
    
}























@end
