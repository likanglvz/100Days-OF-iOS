//
//  Blue.m
//  SwitchView
//
//  Created by 李康 on 16/4/27.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Blue.h"

@interface Blue ()

@end

@implementation Blue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)blue:(id)sender {
    UIAlertView * alter = [[UIAlertView alloc]initWithTitle:@"选中的视图信息" message:@"蓝色视图" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
    
    
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
