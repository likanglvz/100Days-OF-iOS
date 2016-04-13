//
//  ViewController.m
//  multiControll
//
//  Created by baiheng on 16/4/12.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;

@property (weak, nonatomic) IBOutlet UILabel *slider;

@property (weak, nonatomic) IBOutlet UISlider *slid;

@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.slider.text=@"1";
    self.slid.value=1;
    
    self.leftSwitch.hidden=NO;
    self.rightSwitch.hidden=NO;
    self.button.hidden=YES;

    
    
    
    
    
    
    
    
//    int first=(int)self.slider.text;
//    NSString *newText=[[NSString alloc]initWithFormat:@"%d",first];
//    self.slider.text=newText;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nameField:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)numberField:(id)sender {
    [sender resignFirstResponder];
}
-(IBAction)backgroungTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}
- (IBAction)silderChange:(UISlider *)sender {
    int progress=sender.value;
    self.slider.text=[NSString stringWithFormat:@"%d",progress];
}
- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
    
}

- (IBAction)segmentChange:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden=NO;
    self.rightSwitch.hidden=NO;
        self.button.hidden=YES;
    }
    if (sender.selectedSegmentIndex == 1) {
        self.leftSwitch.hidden=YES;
        self.rightSwitch.hidden=YES;
        self.button.hidden=NO;
    }

}
- (IBAction)buttonPRESS:(UIButton *)sender {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"请选择操作" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *yesActin=[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        NSString *s=[NSString stringWithFormat:@"删除%@完成",self.nameField.text];
        UIAlertController *con=[UIAlertController alertControllerWithTitle:@"删除后将不会还原" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *yes=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
            
            UIAlertController *con1=[UIAlertController alertControllerWithTitle:s message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *quxiao=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
            
            [con1 addAction:quxiao];
            [self presentViewController:con1 animated:YES completion:nil];
            self.nameField.text=nil;
            
            

            
        }];
        UIAlertAction *no=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
       
        [con addAction:yes];
        [con addAction:no];


        [self presentViewController:con animated:YES completion:nil];
       
        
     
        
        
    }];
    
    UIAlertAction *noActin=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"save");
    }];

    [controller
     addAction:yesActin];
    [controller addAction:noActin];
    [controller addAction:saveAction];
    
    
    UIPopoverPresentationController *ppc=controller.popoverPresentationController;
    if (ppc!=nil) {
        ppc.sourceView=sender;
        ppc.sourceRect=sender.bounds;
        ppc.permittedArrowDirections=UIPopoverArrowDirectionUp;
    }
    
    [self presentViewController:controller animated:YES completion:nil];

}
@end


