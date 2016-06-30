//
//  ViewController.m
//  testCoredata
//
//  Created by 李康 on 16/5/17.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

static NSString *const kPersonEntityName = @"Person";
static NSString *const kIDCardEntityName = @"IDCard";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *cardField;

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

- (IBAction)save:(id)sender {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //创建并插入托管对象到上下文
    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:kPersonEntityName inManagedObjectContext:context];
    
    //设置托管对象的属性
    NSString *string = self.ageField.text;
    [person setValue:@([string intValue]) forKey:@"age"];
    [person setValue:self.nameField.text forKey:@"name"];
    
    //创建idcard实体的托管对象,并插入到上下文
    NSManagedObject *card = [NSEntityDescription insertNewObjectForEntityForName:kIDCardEntityName inManagedObjectContext:context];
    
    [card setValue:self.cardField.text forKey:@"num"];
    //设置person和card之间的关联关系
    [person setValue:card forKey:@"idcard"];

    NSError *error;
    
    BOOL success = [context save:&error];
    
    if (!success) {
        NSLog(@"处理错误");
    }
    
    self.ageField.text = @"";
    self.nameField.text = @"";
    self.cardField.text = @"";
    
}
- (IBAction)search:(id)sender {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
     NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];
    //提取的实体
    request.entity = [NSEntityDescription entityForName:kPersonEntityName inManagedObjectContext:context];
    //设置排序，按照年龄降序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    //设置提取请求 排序描述符
    request.sortDescriptors = @[sort];
    //谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@",@"bh"];
    request.predicate = predicate;
    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"错误处理");
    }
    for (NSManagedObject *obj in objects) {
        
        self.ageField.text = [NSString stringWithFormat:@"%@",[obj valueForKey:@"age"]];
        self.nameField.text = [obj valueForKey:@"name"];
        self.cardField.text = [[obj valueForKey:@"idcard"] valueForKey:@"num"];
    }
 
}
- (IBAction)search2:(id)sender {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //提取请求
    NSFetchRequest * request = [[NSFetchRequest alloc]init];

    request.entity = [NSEntityDescription entityForName:kIDCardEntityName inManagedObjectContext:context];

    //谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"num like %@",self.cardField.text];
    request.predicate = predicate;

    
    NSError *error;
    //执行提取请求
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"错误处理");
    }
    for (NSManagedObject *obj in objects) {
    
        self.cardField.text = [obj valueForKey:@"num"];
        
        self.ageField.text = [[obj valueForKeyPath:@"person.age"]stringValue];
        
        self.nameField.text = [obj valueForKeyPath:@"person.name"];
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
