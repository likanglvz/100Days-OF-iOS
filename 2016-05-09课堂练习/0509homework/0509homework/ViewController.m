//
//  ViewController.m
//  0509homework
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [self dataFilePath];
    //NSString *filepath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSString *fileName = [filepath  stringByAppendingPathComponent:@"tmp"];
//    
//    
//   const char *s = [self.text1.text UTF8String];
//    
//    NSData *data1=[NSData dataWithBytes:s length:strlen(s)+1];
//    
//    [data1 writeToFile:fileName atomically:YES];
//    
//    
//    NSData *data = [NSData dataWithContentsOfFile:fileName options:0 error:nil];
//    
//    self.text1.text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
        
        
        self.text1.text = array[0];
        self.text2.text = array[0];
    
        
    }
    
    UIApplication *application = [UIApplication sharedApplication];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:application];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)sda:(id)sender {
//    [self resignFirstResponder];
//}

-(NSString *)dataFilePath{
    NSString *path =[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"%@",path);
    NSString *filePath = [path stringByAppendingPathComponent:@"tmp.txt"];
    return filePath;
    
    
}
-(void)applicationWillResignActive:(NSNotification *)notification{

    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    [arr addObject:self.text1.text];
    [arr writeToFile:[self dataFilePath] atomically:YES];
    
    

    
}













@end
