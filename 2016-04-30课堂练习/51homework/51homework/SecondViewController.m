//
//  SecondViewController.m
//  51homework
//
//  Created by 李康 on 16/5/2.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UILabel *pickLabel;


@property (strong,nonatomic)NSDictionary *pickerData;
@property (strong,nonatomic)NSArray *pickProvincaData;
@property (strong,nonatomic)NSArray *pickCitiesData;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistpath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:plistpath];
    self.pickerData = dict;
    self.pickProvincaData = [self.pickerData allKeys];
    
    NSString *selectedProvinces=self.pickProvincaData[0];
    self.pickCitiesData = [self.pickerData objectForKey:selectedProvinces];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonpressed:(id)sender {
    
    NSInteger row1=[self.pickView selectedRowInComponent:0];
    NSInteger row2=[self.pickView selectedRowInComponent:1];
    
    NSString *selected1 = self.pickProvincaData[row1];
    NSString *selected2 = self.pickCitiesData[row2];
    self.pickLabel.text=[NSString stringWithFormat:@"您选择的是%@ %@",selected1,selected2];
}
#pragma  mark - uipickerview data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return [self.pickProvincaData count];
    }else{
        return [self.pickCitiesData count];
    }
}

#pragma mark - pickerview delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.pickProvincaData[row];
    }else{
        return self.pickCitiesData[row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *selectedProvinces=self.pickProvincaData[row];
        self.pickCitiesData = [self.pickerData objectForKey:selectedProvinces];
        
        [self.pickView reloadComponent:1];
    }
}
@end
