//
//  ViewController.m
//  GestureDemo
//
//  Created by 李康 on 16/5/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *single1;
@property (weak, nonatomic) IBOutlet UILabel *single2;
@property (weak, nonatomic) IBOutlet UILabel *single3;
@property (weak, nonatomic) IBOutlet UILabel *single4;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(strong,nonatomic) UIImageView *imageView;



@end

@implementation ViewController
{
    CGFloat scale,previousScale;
    CGFloat rotation,previousRotation;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //点击手势识别
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singletap)];
    //手势特点  tap次数为1   touch数目为1
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    //将手势加入视图
    [self.view addGestureRecognizer:singleTap];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubletap)];
    
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    
    //有依赖关系的识别，双击没有识别后，识别单击
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UITapGestureRecognizer *tripleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tripletap)];
    
    tripleTap.numberOfTapsRequired = 3;
    tripleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tripleTap];
    
    [doubleTap requireGestureRecognizerToFail:tripleTap];
    

    UITapGestureRecognizer *fourTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fourtap)];
    
    fourTap.numberOfTapsRequired = 4;
    fourTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:fourTap];
    
    [tripleTap requireGestureRecognizerToFail:fourTap];
    
    
    //定义扫动手势识别器
    UISwipeGestureRecognizer *vertical = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(reportVerticalSwipe:)];
    //方向属性，上下均为垂直
    vertical.direction = UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp;
    
    [self.view addGestureRecognizer:vertical];
    
    
    //--------------------------------- 捏合手势识别器
    //创建图像视图，摆放图像
    
    //初始比例为1
    previousScale = 1;
    
    
    
    UIImage *image = [UIImage imageNamed:@"card-back.png"];
    self.imageView = [[UIImageView alloc]initWithImage:image];
    self.imageView.center = self.view.center;
    
    self.imageView.userInteractionEnabled = YES;

    [self.view addSubview:self.imageView];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(doPinch:)];
    
    pinchGesture.delegate = self;
    
    [self.imageView addGestureRecognizer:pinchGesture];
    //-----------------------------------旋转手势识别器
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(doRotate:)];
    rotationGesture.delegate = self;
    [self.imageView addGestureRecognizer:rotationGesture];
    
    
    
}

-(void)transformImageView{
    //仿射变换,返回尺度变换的矩阵
    CGAffineTransform t = CGAffineTransformMakeScale(scale *previousScale, scale*previousScale);
    
    //在仿射变换阵上添加旋转分量
    t = CGAffineTransformRotate(t, rotation+previousRotation);
    
    
    //图像视图上添加变换
    self.imageView.transform = t;

}

//捏合手势的回调
-(void)doPinch:(UIPinchGestureRecognizer *)gesture{
    //手势产生的缩放系数
    scale = gesture.scale;
    [self transformImageView];
    
    //手势结束时，保存缩放的比例
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        previousScale = scale * previousScale;
        scale = 1;
        
    }
    
    
}

//旋转手势的回调
-(void)doRotate:(UIRotationGestureRecognizer *)gesture{
    
    rotation = gesture.rotation;
    [self transformImageView];
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        previousRotation = rotation + previousRotation;
        
        rotation = 0;
    }
    
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)singletap{
    
    self.single1.text = @"单击，徐斌是猪!";
    //延迟两秒清空
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.single1.text = @"";
    });
  
}

-(void)doubletap{
    
    self.single2.text = @"双击，徐斌是猪!";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.single2.text = @"";
    });

    
}

-(void)tripletap{
    
    self.single3.text = @"三连击，徐斌是猪!";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.single3.text = @"";
    });
}

-(void)fourtap{
    
    self.single4.text = @"四连击，徐斌是猪!";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.single4.text = @"";
    });
    
}

-(void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer{
    
    self.label.text = @"垂直扫动,徐斌是猪!";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.label.text = @"";
    });
    
    
    
    
}

- (IBAction)tapOnLabel:(id)sender {
    
    NSLog(@"tap");
    
}








@end
