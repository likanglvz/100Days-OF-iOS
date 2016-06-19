//
//  ViewController.m
//  homework
//
//  Created by 李康 on 16/5/10.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory =paths[0];
    
    NSString *fName =[documentDirectory stringByAppendingPathComponent:@"NSArray.plist"];
    NSFileManager *fm=[NSFileManager defaultManager];
    NSLog(@"%@",fName);
    if([fm fileExistsAtPath:fName]){
        NSArray *array=[[NSArray alloc]initWithContentsOfFile:fName];
        self.textField1.text=array[0];
        self.textField2.text=array[1];
        self.textField3.text=array[2];
        self.textField4.text=array[3];}

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sads:(id)sender {
    
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
        NSString *documentDirectory =paths[0];
    
        NSString *fName =[documentDirectory stringByAppendingPathComponent:@"NSArray.plist"];
        NSFileManager *fm=[NSFileManager defaultManager];
        if([fm fileExistsAtPath:fName]==NO){
            [fm createFileAtPath:fName contents:nil attributes:nil];
    
            NSString *s1=self.textField1.text;
            NSString *s2=self.textField2.text;
            NSString *s3=self.textField3.text;
            NSString *s4=self.textField4.text;
            NSArray *arr =@[s1,s2,s3,s4];
            NSMutableArray *array =[NSMutableArray arrayWithArray:arr];
    
            [array writeToFile:fName atomically:YES];
        }
        else{
            NSString *s1=self.textField1.text;
            NSString *s2=self.textField2.text;
            NSString *s3=self.textField3.text;
            NSString *s4=self.textField4.text;
            NSArray *arr =@[s1,s2,s3,s4];
            NSMutableArray *array =[NSMutableArray arrayWithArray:arr];
    
            [array writeToFile:fName atomically:YES];
        }
        [sender resignFirstResponder];

    
    
}




@end
