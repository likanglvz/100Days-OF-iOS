//
//  FirstViewController.m
//  51homework
//
//  Created by 李康 on 16/5/2.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicjer;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    
    NSDate * date = self.datepicjer.date;
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    self.datelabel.text = [dateFormatter stringFromDate:date];

}

@end
