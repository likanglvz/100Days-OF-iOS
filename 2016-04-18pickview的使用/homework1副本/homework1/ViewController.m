//
//  ViewController.m
//  homework1
//
//  Created by 李康 on 16/4/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property(strong,nonatomic)NSArray *images;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.images=@[@" ",@" ",@" ",@" ",@" ",@"子弹",@" ",@" ",@" ",@" ",@" ",@" "];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - PickerView Data Source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.images count];
    
}
- (IBAction)spin:(UIButton *)sender {
    int newValue = arc4random_uniform((uint)[self.images count]);
    [self.pickerView selectRow:newValue inComponent:0 animated:YES];
    if ([self.images[newValue] isEqualToString:@"子弹"]) {
        self.label.text=@"you dead";
    }else{
        self.label.text=@"good luck";
    }

    
    
}

#pragma mark - PickerView Delegate
//每行的视图
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.images[row];
}
//设置行高
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 64;
}

@end
