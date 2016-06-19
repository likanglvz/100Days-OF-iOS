//
//  ThirdViewController.m
//  51homework
//
//  Created by 李康 on 16/5/2.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *pickLabe;

@property(strong,nonatomic)NSArray *images;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.images=@[[UIImage imageNamed:@"seven"],[UIImage imageNamed:@"apple"],[UIImage imageNamed:@"crown"],[UIImage imageNamed:@"bar"],[UIImage imageNamed:@"cherry"],[UIImage imageNamed:@"lemon"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    BOOL win = NO;
    
    int a[5]={0};
    int count = 0;
    for (int i = 0 ; i<5; i++) {
        int newValue = arc4random_uniform((uint)[self.images count]);
        a[i]=newValue;
        for (int j=0; j<i; j++) {
            if (a[i]==a[j]) {
                count++;
            }
        }
        
        [self.pickerView selectRow:a[i] inComponent:i animated:YES];
        //[self.pickerView reloadComponent:i];
        
        if (count>=3) {
            win=YES;
        }
        
    }
    if (win) {
        self.pickLabe.text=@"卧槽，你好牛逼!";
    }else{
        self.pickLabe.text=@"卧槽，你好垃圾!";
    }
    
}

#pragma mark - PickerView Data Source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.images count];
    
}

#pragma mark - PickerView Delegate
//每行的视图
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    return imageView;
    
}
//设置行高
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 64;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
