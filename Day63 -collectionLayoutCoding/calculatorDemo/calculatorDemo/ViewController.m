//
//  ViewController.m
//  calculatorDemo
//
//  Created by baiheng on 16/5/6.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myView;

@property(strong,nonatomic) MyModel * myModel;


@end

@implementation ViewController

//view 通过action向controller报告事件的发生

- (IBAction)run:(id)sender {
    
  
    
    
 //   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(result:) name:@"MyResult" object:nil];
    
    
    UIButton * uiBtn = (UIButton *)sender;
    //取按钮标题
    NSString * title = uiBtn.currentTitle;
    //controller 直接与model对话
    [self.myModel setModel:[title characterAtIndex:0]];
    
    
    double t = [[self.myModel valueForKey:@"accumulator"]doubleValue];
    [self.myModel setValue:@(t) forKey:@"accumulator"];
    
    
    
  
    
    //显示计算结果
 //   NSString * s = [self.myModel getModel];
    //controller可以直接和view对话，通过outlet属性直接访问view
  //  self.myView.text = s;
    
    
    
}


//kvo回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"accumulator"]) {
        NSNumber * num = change[NSKeyValueChangeNewKey];
        self.myView.text = [NSString stringWithFormat:@"%f",num.doubleValue];
        
        
        
    }
}





-(void)result:(NSNotification *)notification
{
    
    NSDictionary * theData = [notification userInfo];
    
    NSNumber * r = theData[@"result"];
    
    self.myView.text = [NSString stringWithFormat:@"%f",r.doubleValue];
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myModel = [[MyModel alloc]init];
    
    //self注册成为self。mymodel的kvo观察者
    [self.myModel addObserver:self forKeyPath:@"accumulator" options:NSKeyValueObservingOptionNew context:NULL];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
