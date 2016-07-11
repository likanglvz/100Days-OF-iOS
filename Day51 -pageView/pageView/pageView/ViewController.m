//
//  ViewController.m
//  pageView
//
//  Created by 李康 on 16/4/28.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
enum DirectionForward{
    
    ForwordBefor = 1,//向前翻
    
    ForwordAfter = 2//向后翻
    
    
};



@interface ViewController ()
@property(strong,nonatomic) UIPageViewController *pageViewController;
@property(strong,nonatomic) NSArray *arr;



@end

@implementation ViewController
{
    //页的索引
    int pageIndex;
    int directionForward;//记录翻页方向
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *p1=[mainStoryboard instantiateViewControllerWithIdentifier:@"page1"];
    
    [self.pageViewController setViewControllers:@[p1] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
    [self.view addSubview:self.pageViewController.view];
    pageIndex = 0;
    
    
    UIViewController * pv2Controller = [self.storyboard instantiateViewControllerWithIdentifier:@"page2"];
     UIViewController * pv3Controller = [self.storyboard instantiateViewControllerWithIdentifier:@"page3"];
    self.arr = @[p1,pv2Controller,pv3Controller];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
     pageIndex= pageIndex+1;
    
    if (pageIndex>2) {
         pageIndex=2;
        return nil;
    }
    
    //翻页状态
    directionForward = ForwordAfter;
    
//    NSString *pageid = [NSString stringWithFormat:@"page%i",pageIndex+1];
//    UIViewController * pvController = [self.storyboard instantiateViewControllerWithIdentifier:pageid];
    NSLog(@"向后");
    NSLog(@"%i",pageIndex+1);
    return self.arr[pageIndex];
    

    
}

//向前翻页
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    pageIndex = pageIndex-1;
    if (pageIndex < 0) {
         pageIndex=0;
        return nil;
    }
    //NSLog(@"%i",pageIndex);
    //翻页状态
    directionForward = ForwordBefor;
    
    
    
    
    
//    NSString *pageid = [NSString stringWithFormat:@"page%i",pageIndex+1];
//    UIViewController * pvController = [self.storyboard instantiateViewControllerWithIdentifier:pageid];
    
     NSLog(@"向前");
    NSLog(@"%i",pageIndex+1);
    return self.arr[pageIndex];
   
    
}

#pragma mark - uipageviewcontroller delegate

-(UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation{
    
    self.pageViewController.doubleSided = NO;//单面显示
    
    return UIPageViewControllerSpineLocationMin;//书脊位置在左边
}

//判断是否成功翻页
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (!completed) {
        if (directionForward == ForwordAfter) {
            
            pageIndex=pageIndex-1;
           //[self.view addSubview:previousViewControllers[pageIndex].view];

            
        }
        if (directionForward==ForwordBefor) {
                        pageIndex=pageIndex+1;
           // [self.view addSubview:previousViewControllers[pageIndex].view];

        }
    }
    
    
}










@end
