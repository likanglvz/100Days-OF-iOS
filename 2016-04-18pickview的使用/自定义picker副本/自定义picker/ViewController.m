//
//  ViewController.m
//  自定义picker
//
//  Created by 李康 on 16/4/18.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property(strong,nonatomic)NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.images=@[[UIImage imageNamed:@"seven"],[UIImage imageNamed:@"apple"],[UIImage imageNamed:@"crown"],[UIImage imageNamed:@"bar"],[UIImage imageNamed:@"cherry"],[UIImage imageNamed:@"lemon"]];
    
    
    
    
    
    
    
    
    
}
//- (IBAction)spin:(UIButton *)sender {
//    BOOL win = NO;
//    int lastValue = -1;
//    int numInRow = 1;

//    for (int i = 0 ; i<5; i++) {
//        int newValue = arc4random_uniform((uint)[self.images count]);
//        if (newValue==lastValue) {
//            numInRow++;
//        }else{
//            numInRow=1;
//        }
//        lastValue=newValue;
//         [self.pickerView selectRow:newValue inComponent:i animated:YES];
//        //[self.pickerView reloadComponent:i];
//        
//        if (numInRow>=3) {
//            win=YES;
//        }
//        
//    }
//    if (win) {
//        self.winLabel.text=@"卧槽，你好牛逼!";
//    }else{
//        self.winLabel.text=@"卧槽，你好垃圾!";
//    }
//    
//    
//    
//    
//    
//}
- (IBAction)spin:(UIButton *)sender {
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
        self.winLabel.text=@"卧槽，你好牛逼!";
    }else{
        self.winLabel.text=@"卧槽，你好垃圾!";
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



@end
