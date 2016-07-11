//
//  ViewController.m
//  homework0517
//
//  Created by 李康 on 16/5/17.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
static NSString *const kStudentEntityName = @"Student";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UITextField *classNum;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *idd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    
    request.entity = [NSEntityDescription entityForName:kStudentEntityName inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"num > 0"];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    self.index = (int)[objects count];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //创建并插入托管对象到上下文
    NSManagedObject *student = [NSEntityDescription insertNewObjectForEntityForName:kStudentEntityName inManagedObjectContext:context];
    
    [student setValue:self.num.text forKey:@"num"];
    [student setValue:self.classNum.text forKey:@"classs"];
    [student setValue:self.name.text forKey:@"name"];
    [student setValue:@(self.index) forKey:@"index"];
    
    NSError *error;
    
    BOOL success = [context save:&error];
    
    if (!success) {
        NSLog(@"处理错误");
    }
    
    self.status.text = @"保存成功";
   self.num.text =@"";
    self.classNum.text=@"";
    self.name.text=@"";
    self.index+=1;

    
    
}
- (IBAction)search:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    
    request.entity = [NSEntityDescription entityForName:kStudentEntityName inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"num like %@",self.num.text];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count]<1) {
        self.status.text =@"搜索失败";
        return;
    }

    if (error) {
        NSLog(@"错误处理");
    }
    for (NSManagedObject *obj in objects) {
        
        self.num.text = [obj valueForKey:@"num"];
        
        self.classNum.text = [obj valueForKey:@"classs"];
        
        self.name.text = [obj valueForKey:@"name"];
        
        self.idd.text = [NSString stringWithFormat:@"%@",[obj valueForKey:@"index"]];
        
        self.status.text = @"搜索成功";
        
    }
 
}

- (IBAction)last:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    
    request.entity = [NSEntityDescription entityForName:kStudentEntityName inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"index =%d",[self.idd.text intValue]-1 ];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"错误处理");
    }
    for (NSManagedObject *obj in objects) {
        
        self.num.text = [obj valueForKey:@"num"];
        
        self.classNum.text = [obj valueForKey:@"classs"];
        
        self.name.text = [obj valueForKey:@"name"];
        
        self.idd.text = [NSString stringWithFormat:@"%@",[obj valueForKey:@"index"]];
        
        self.status.text = @"搜索成功";
        
    }

    
    
    
    
    
    
    
}

- (IBAction)next:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    
    request.entity = [NSEntityDescription entityForName:kStudentEntityName inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"index =%d",[self.idd.text intValue]+1 ];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    
        if (error) {
        NSLog(@"错误处理");
    }
    for (NSManagedObject *obj in objects) {
        
        self.num.text = [obj valueForKey:@"num"];
        
        self.classNum.text = [obj valueForKey:@"classs"];
        
        self.name.text = [obj valueForKey:@"name"];
        
        self.idd.text = [NSString stringWithFormat:@"%@",[obj valueForKey:@"index"]];
        
        self.status.text = @"搜索成功";
        
    }
}

- (IBAction)clear:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    
    request.entity = [NSEntityDescription entityForName:kStudentEntityName inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"num like %@",self.num.text];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *obj in objects) {
        
     [context deleteObject:obj];
    
    }

    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"index >%d",[self.idd.text intValue]];
    request.predicate = predicate1;
    
     objects = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject *obj1 in objects) {
        
        int tmp = [[obj1 valueForKey:@"index"]intValue];
        [obj1 setValue:@(tmp-1) forKey:@"index"];
      
        
    }

    
    self.status.text = @"删除成功";
    self.num.text =@"";
    self.classNum.text=@"";
    self.name.text=@"";
    
    [context save:&error];
}

@end
