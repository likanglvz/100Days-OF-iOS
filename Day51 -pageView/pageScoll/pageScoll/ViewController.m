//
//  ViewController.m
//  pageScoll
//
//  Created by 李康 on 16/4/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(strong,nonatomic)UIView *p1;
@property(strong,nonatomic)UIView *p2;
@property(strong,nonatomic)UIView *p3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3,self.scrollView.frame.size.height);
    self.scrollView.frame = self.view.frame;
    self.p1 = [self.storyboard instantiateViewControllerWithIdentifier:@"page1"].view;
    self.p2 = [self.storyboard instantiateViewControllerWithIdentifier:@"page2"].view;
    self.p3 = [self.storyboard instantiateViewControllerWithIdentifier:@"page3"].view;

    self.p1.frame=CGRectMake(0.0, 0.0, self.view.frame.size.width, self.scrollView.frame.size.height);
    self.p2.frame=CGRectMake(self.view.frame.size.width, 0.0, self.view.frame.size.width, self.scrollView.frame.size.height);
    self.p3.frame=CGRectMake(self.view.frame.size.width*2, 0.0, self.view.frame.size.width, self.scrollView.frame.size.height);
    
    [self.scrollView addSubview:self.p1];
    [self.scrollView addSubview:self.p2];
    [self.scrollView addSubview:self.p3];

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //滚动的偏移量
    CGPoint offset = scrollView.contentOffset;
    //设定页面控件的当前页
    self.pageControl.currentPage = offset.x/(self.view.frame.size.width);
    
    
}

- (IBAction)changePage:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        NSInteger page = self.pageControl.currentPage;
        self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width*page, 0.0);
    }];
    
  
   
}

@end
