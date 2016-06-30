//
//  pokerViewController.m
//  ModalViewController
//
//  Created by 李康 on 16/5/31.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "pokerViewController.h"
#import "Player.h"



@interface pokerViewController ()
@property(nonatomic,strong) NSMutableArray *arr1;
@property(nonatomic,strong) NSMutableArray *arr2;
@property(nonatomic,strong) NSMutableArray *arr3;
@property(nonatomic,strong) NSMutableArray *arr4;
@property(nonatomic,strong) NSArray *array;
@property(nonatomic,strong) NSArray *arry; //存放12张牌
@property(nonatomic,strong) NSArray *players;//存放四个玩家
@property(nonatomic,strong) NSArray *playmoney;



@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIImageView *image5;
@property (weak, nonatomic) IBOutlet UIImageView *image6;
@property (weak, nonatomic) IBOutlet UIImageView *image7;
@property (weak, nonatomic) IBOutlet UIImageView *image8;
@property (weak, nonatomic) IBOutlet UIImageView *image9;
@property (weak, nonatomic) IBOutlet UIImageView *image10;
@property (weak, nonatomic) IBOutlet UIImageView *image11;
@property (weak, nonatomic) IBOutlet UIImageView *image12;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;


@property(strong,nonatomic)Player *p1;
@property(strong,nonatomic)Player *p2;
@property(strong,nonatomic)Player *p3;
@property(strong,nonatomic)Player *p4;

@property (weak, nonatomic) IBOutlet UIImageView *red1;
@property (weak, nonatomic) IBOutlet UIImageView *red2;
@property (weak, nonatomic) IBOutlet UIImageView *red3;
@property (weak, nonatomic) IBOutlet UIImageView *red4;

@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;
@property (weak, nonatomic) IBOutlet UILabel *l3;
@property (weak, nonatomic) IBOutlet UILabel *l4;

@property(assign,nonatomic) int n;








@end

@implementation pokerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *tmp1;
    NSArray *tmp2;
    NSArray *tmp3;
    NSArray *tmp4;
    
    tmp1 = @[
             @{@"name":@"club-1",@"value":@"24"},
             @{@"name":@"club-2",@"value":@"12"},
             @{@"name":@"club-3",@"value":@"13"},
             @{@"name":@"club-4",@"value":@"14"},
             @{@"name":@"club-5",@"value":@"15"},
             @{@"name":@"club-6",@"value":@"16"},
             @{@"name":@"club-7",@"value":@"17"},
             @{@"name":@"club-8",@"value":@"18"},
             @{@"name":@"club-9",@"value":@"19"},
             @{@"name":@"club-10",@"value":@"20"},
             @{@"name":@"club-11",@"value":@"21"},
             @{@"name":@"club-12",@"value":@"22"},
             @{@"name":@"club-13",@"value":@"23"}
             ];
    
    tmp2 = @[
             @{@"name":@"spade-1",@"value":@"24"},
             @{@"name":@"spade-2",@"value":@"12"},
             @{@"name":@"spade-3",@"value":@"13"},
             @{@"name":@"spade-4",@"value":@"14"},
             @{@"name":@"spade-5",@"value":@"15"},
             @{@"name":@"spade-6",@"value":@"16"},
             @{@"name":@"spade-7",@"value":@"17"},
             @{@"name":@"spade-8",@"value":@"18"},
             @{@"name":@"spade-9",@"value":@"19"},
             @{@"name":@"spade-10",@"value":@"20"},
             @{@"name":@"spade-11",@"value":@"21"},
             @{@"name":@"spade-12",@"value":@"22"},
             @{@"name":@"spade-13",@"value":@"23"}
             ];
    tmp3 = @[
             @{@"name":@"diamond-1",@"value":@"24"},
             @{@"name":@"diamond-2",@"value":@"12"},
             @{@"name":@"diamond-3",@"value":@"13"},
             @{@"name":@"diamond-4",@"value":@"14"},
             @{@"name":@"diamond-5",@"value":@"15"},
             @{@"name":@"diamond-6",@"value":@"16"},
             @{@"name":@"diamond-7",@"value":@"17"},
             @{@"name":@"diamond-8",@"value":@"18"},
             @{@"name":@"diamond-9",@"value":@"19"},
             @{@"name":@"diamond-10",@"value":@"20"},
             @{@"name":@"diamond-11",@"value":@"21"},
             @{@"name":@"diamond-12",@"value":@"22"},
             @{@"name":@"diamond-13",@"value":@"23"}
             ];
    tmp4 = @[
             @{@"name":@"heart-1",@"value":@"24"},
             @{@"name":@"heart-2",@"value":@"12"},
             @{@"name":@"heart-3",@"value":@"13"},
             @{@"name":@"heart-4",@"value":@"14"},
             @{@"name":@"heart-5",@"value":@"15"},
             @{@"name":@"heart-6",@"value":@"16"},
             @{@"name":@"heart-7",@"value":@"17"},
             @{@"name":@"heart-8",@"value":@"18"},
             @{@"name":@"heart-9",@"value":@"19"},
             @{@"name":@"heart-10",@"value":@"20"},
             @{@"name":@"heart-11",@"value":@"21"},
             @{@"name":@"heart-12",@"value":@"22"},
             @{@"name":@"heart-13",@"value":@"23"}
             ];
    
    self.arr1 = [[NSMutableArray alloc]initWithArray:tmp1];
    self.arr2 = [[NSMutableArray alloc]initWithArray:tmp2];
    self.arr3 = [[NSMutableArray alloc]initWithArray:tmp3];
    self.arr4 = [[NSMutableArray alloc]initWithArray:tmp4];
    
    
    self.array = @[self.arr1,self.arr2,self.arr3,self.arr4];

    
    [self initTheGame];
    
    [self creatPlayer];
    
    [self startTheGame];

    
    

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//初始化游戏
-(void)initTheGame{
    
    self.arry = @[self.image1,self.image2,self.image3,self.image4,self.image5,self.image6,self.image7,self.image8,self.image9,self.image10,self.image11,self.image12];
    
    
    for (int i =0; i<12; i++) {
        
        UIImageView *imag =self.arry[i];
        imag.image =[UIImage imageNamed:@"card-back"];
        
        
        
    }
    self.label1.text = @"底注:100";
    self.label2.text = @"单注:100";
    self.label3.text = @"总注:400";
    self.label4.text = @"轮数:1/20";
    self.n=0;
    
}

-(void)startTheGame{
    
    //[self creatPlayer];
    
    int n =arc4random_uniform(4);
    Player * p =[self.players objectAtIndex:n];
    p.did = 1;
    p.red.hidden=NO;
    
    NSLog(@"初始化庄家：%d",n);
    
    
    
}

-(void)creatPlayer{
    
    
    self.p1 = [[Player alloc]init];
    self.p2 = [[Player alloc]init];
    self.p3 = [[Player alloc]init];
    self.p4 = [[Player alloc]init];
    self.players = @[self.p1,self.p2,self.p3,self.p4];
    self.playmoney = @[self.l1,self.l2,self.l3,self.l4];
    
    
    for (int i = 0; i<4; i++) {
        Player *p = self.players[i];
        if (p.money==0) {
            
            p.money = 10000;
            
        }
        
        p.did=0;
        
    }
    
    self.p1.m1=self.image10;
    self.p1.m2=self.image11;
    self.p1.m3=self.image12;
    self.p1.red = self.red1;
    self.p1.label=self.l1;
    self.l1.text = [NSString stringWithFormat:@"%d",self.p1.money];
    self.p1.red.hidden=YES;
    
    self.p2.m1=self.image7;
    self.p2.m2=self.image8;
    self.p2.m3=self.image9;
    self.p2.red = self.red2;
    self.p2.label=self.l2;
    self.l2.text = [NSString stringWithFormat:@"%d",self.p2.money];
    self.p2.red.hidden=YES;
    
    self.p3.m1=self.image4;
    self.p3.m2=self.image5;
    self.p3.m3=self.image6;
    self.p3.red = self.red3;
    self.p3.label=self.l3;
    self.l3.text = [NSString stringWithFormat:@"%d",self.p3.money];
    self.p3.red.hidden=YES;
    
    self.p4.m1=self.image1;
    self.p4.m2=self.image2;
    self.p4.m3=self.image3;
    self.p4.red = self.red4;
    self.p4.label=self.l4;
    self.l4.text = [NSString stringWithFormat:@"%d",self.p4.money];
    self.p4.red.hidden=YES;
    
    
}



- (IBAction)compare:(id)sender {
    
    
    int num1 =arc4random_uniform(4);
    // NSLog(@"%d",num1);
    int num2 = arc4random_uniform((int)[self.array[num1] count]);
    //NSLog(@"num2=%d",num2);
    
    UIImageView *imag =self.p1.m1;
    imag.image = [UIImage imageNamed:[self.array[num1][num2] objectForKey:@"name"]];
    NSString *v1 = [self.array[num1][num2] objectForKey:@"value"];
    //self.image1.image = imag.image;
    [self.array[num1] removeObjectAtIndex:num2];
    
    int num3 =arc4random_uniform(4);
    int num4 = arc4random_uniform((int)[self.array[num3] count]);
    imag =self.p1.m2;
    imag.image = [UIImage imageNamed:[self.array[num3][num4] objectForKey:@"name"]];
    NSString *v2 = [self.array[num3][num4] objectForKey:@"value"];
    [self.array[num3] removeObjectAtIndex:num4];
    
    int num5 =arc4random_uniform(4);
    int num6 = arc4random_uniform((int)[self.array[num5] count]);
    imag =self.p1.m3;
    imag.image = [UIImage imageNamed:[self.array[num5][num6] objectForKey:@"name"]];
    NSString *v3 = [self.array[num5][num6] objectForKey:@"value"];
    [self.array[num5] removeObjectAtIndex:num6];
    int a = [v1 intValue];
    int b = [v2 intValue];
    int c = [v3 intValue];
    NSLog(@"%d,%d,%d",num1,num3,num5);
    for(int i=0;i<3;i++)//排序
    {
        int tmp;
        if (a>b)
            
        {
            tmp=a;
            a=b;
            b=tmp; }
        if (b>c)
        { tmp=b;b=c; c=tmp; }
    }
    
    
    if (a==b&&a==c) {//豹子
        
        self.p1.value = [NSString stringWithFormat:@"6%d%d%d",c,b,a];
        
    }
    else if (num1==num3&&num1==num5) {//顺金 和 金花
        
        if (c==24&&b==13&&a==12) {
            
            self.p1.value = @"5131211";
        }
        if (c-b==1&&b-a==1) {
            
            self.p1.value = [NSString stringWithFormat:@"5%d%d%d",c,b,a];
            
        }else{
            
            self.p1.value = [NSString stringWithFormat:@"4%d%d%d",c,b,a];
            
        }
        
        
    }
    
    else if (c==24&&b==13&&a==12) {//顺子 A23
        self.p1.value = @"3131211";
    }
    else if (c-b==1&&b-a==1) {//顺子其他
        
        self.p1.value = [NSString stringWithFormat:@"3%d%d%d",c,b,a];
        
    }
    else  if (a==b||b==c) {//对子
        if (a==b) {
            self.p1.value = [NSString stringWithFormat:@"2%d%d%d",a,b,c];
        }
        if (c==b) {
            self.p1.value = [NSString stringWithFormat:@"2%d%d%d",c,b,a];
        }
        
    }
    
    
    else{
        
        self.p1.value = [NSString stringWithFormat:@"1%d%d%d",c,b,a];
        
    }
    NSLog(@"%@",self.p1.value);
    
    
    
    
    
    
    
    
    num1 =arc4random_uniform(4);
    // NSLog(@"%d",num1);
    num2 = arc4random_uniform((int)[self.array[num1] count]);
    //NSLog(@"num2=%d",num2);
    
    imag =self.p2.m1;
    imag.image = [UIImage imageNamed:[self.array[num1][num2] objectForKey:@"name"]];
    v1 = [self.array[num1][num2] objectForKey:@"value"];
    //self.image1.image = imag.image;
    [self.array[num1] removeObjectAtIndex:num2];
    
    num3 =arc4random_uniform(4);
    num4 = arc4random_uniform((int)[self.array[num3] count]);
    imag =self.p2.m2;
    imag.image = [UIImage imageNamed:[self.array[num3][num4] objectForKey:@"name"]];
    v2 = [self.array[num3][num4] objectForKey:@"value"];
    [self.array[num3] removeObjectAtIndex:num4];
    
    num5 =arc4random_uniform(4);
    num6 = arc4random_uniform((int)[self.array[num5] count]);
    imag =self.p2.m3;
    imag.image = [UIImage imageNamed:[self.array[num5][num6] objectForKey:@"name"]];
    v3 = [self.array[num5][num6] objectForKey:@"value"];
    [self.array[num5] removeObjectAtIndex:num6];
    a = [v1 intValue];
    b = [v2 intValue];
    c = [v3 intValue];
    NSLog(@"%d,%d,%d",num1,num3,num5);
    for(int i=0;i<3;i++)//排序
    {
        int tmp;
        if (a>b)
            
        {
            tmp=a;
            a=b;
            b=tmp; }
        if (b>c)
        { tmp=b;b=c; c=tmp; }
    }
    
    
    if (a==b&&a==c) {//豹子
        
        self.p2.value = [NSString stringWithFormat:@"6%d%d%d",c,b,a];
        
    }
    else if (num1==num3&&num1==num5) {//顺金 和 金花
        
        if (c==24&&b==13&&a==12) {
            
            self.p2.value = @"5131211";
        }
        if (c-b==1&&b-a==1) {
            
            self.p2.value = [NSString stringWithFormat:@"5%d%d%d",c,b,a];
            
        }else{
            
            self.p2.value = [NSString stringWithFormat:@"4%d%d%d",c,b,a];
            
        }
        
        
    }
    
    else if (c==24&&b==13&&a==12) {//顺子 A23
        self.p2.value = @"3131211";
    }
    else if (c-b==1&&b-a==1) {//顺子其他
        
        self.p2.value = [NSString stringWithFormat:@"3%d%d%d",c,b,a];
        
    }
    else  if (a==b||b==c) {//对子
        if (a==b) {
            self.p2.value = [NSString stringWithFormat:@"2%d%d%d",a,b,c];
        }
        if (c==b) {
            self.p2.value = [NSString stringWithFormat:@"2%d%d%d",c,b,a];
        }
        
    }
    
    
    else{
        
        self.p2.value = [NSString stringWithFormat:@"1%d%d%d",c,b,a];
        
    }
    NSLog(@"%@",self.p2.value);
    
    
    
    
    
    
    num1 =arc4random_uniform(4);
    // NSLog(@"%d",num1);
    num2 = arc4random_uniform((int)[self.array[num1] count]);
    //NSLog(@"num2=%d",num2);
    
    imag =self.p3.m1;
    imag.image = [UIImage imageNamed:[self.array[num1][num2] objectForKey:@"name"]];
    v1 = [self.array[num1][num2] objectForKey:@"value"];
    //self.image1.image = imag.image;
    [self.array[num1] removeObjectAtIndex:num2];
    
    num3 =arc4random_uniform(4);
    num4 = arc4random_uniform((int)[self.array[num3] count]);
    imag =self.p3.m2;
    imag.image = [UIImage imageNamed:[self.array[num3][num4] objectForKey:@"name"]];
    v2 = [self.array[num3][num4] objectForKey:@"value"];
    [self.array[num3] removeObjectAtIndex:num4];
    
    num5 =arc4random_uniform(4);
    num6 = arc4random_uniform((int)[self.array[num5] count]);
    imag =self.p3.m3;
    imag.image = [UIImage imageNamed:[self.array[num5][num6] objectForKey:@"name"]];
    v3 = [self.array[num5][num6] objectForKey:@"value"];
    [self.array[num5] removeObjectAtIndex:num6];
    a = [v1 intValue];
    b = [v2 intValue];
    c = [v3 intValue];
    NSLog(@"%d,%d,%d",num1,num3,num5);
    for(int i=0;i<3;i++)//排序
    {
        int tmp;
        if (a>b)
            
        {
            tmp=a;
            a=b;
            b=tmp; }
        if (b>c)
        { tmp=b;b=c; c=tmp; }
    }
    
    
    if (a==b&&a==c) {//豹子
        
        self.p3.value = [NSString stringWithFormat:@"6%d%d%d",c,b,a];
        
    }
    else if (num1==num3&&num1==num5) {//顺金 和 金花
        
        if (c==24&&b==13&&a==12) {
            
            self.p3.value = @"5131211";
        }
        if (c-b==1&&b-a==1) {
            
            self.p3.value = [NSString stringWithFormat:@"5%d%d%d",c,b,a];
            
        }else{
            
            self.p3.value = [NSString stringWithFormat:@"4%d%d%d",c,b,a];
            
        }
        
        
    }
    
    else if (c==24&&b==13&&a==12) {//顺子 A23
        self.p3.value = @"3131211";
    }
    else if (c-b==1&&b-a==1) {//顺子其他
        
        self.p3.value = [NSString stringWithFormat:@"3%d%d%d",c,b,a];
        
    }
    else  if (a==b||b==c) {//对子
        if (a==b) {
            self.p3.value = [NSString stringWithFormat:@"2%d%d%d",a,b,c];
        }
        if (c==b) {
            self.p3.value = [NSString stringWithFormat:@"2%d%d%d",c,b,a];
        }
        
    }
    
    
    else{
        
        self.p3.value = [NSString stringWithFormat:@"1%d%d%d",c,b,a];
        
    }
    NSLog(@"%@",self.p3.value);
    
    
    
    
    
    
    
    num1 =arc4random_uniform(4);
    // NSLog(@"%d",num1);
    num2 = arc4random_uniform((int)[self.array[num1] count]);
    //NSLog(@"num2=%d",num2);
    
    imag =self.p4.m1;
    imag.image = [UIImage imageNamed:[self.array[num1][num2] objectForKey:@"name"]];
    v1 = [self.array[num1][num2] objectForKey:@"value"];
    //self.image1.image = imag.image;
    [self.array[num1] removeObjectAtIndex:num2];
    
    num3 =arc4random_uniform(4);
    num4 = arc4random_uniform((int)[self.array[num3] count]);
    imag =self.p4.m2;
    imag.image = [UIImage imageNamed:[self.array[num3][num4] objectForKey:@"name"]];
    v2 = [self.array[num3][num4] objectForKey:@"value"];
    [self.array[num3] removeObjectAtIndex:num4];
    
    num5 =arc4random_uniform(4);
    num6 = arc4random_uniform((int)[self.array[num5] count]);
    imag =self.p4.m3;
    imag.image = [UIImage imageNamed:[self.array[num5][num6] objectForKey:@"name"]];
    v3 = [self.array[num5][num6] objectForKey:@"value"];
    [self.array[num5] removeObjectAtIndex:num6];
    a = [v1 intValue];
    b = [v2 intValue];
    c = [v3 intValue];
    NSLog(@"%d,%d,%d",num1,num3,num5);
    for(int i=0;i<3;i++)//排序
    {
        int tmp;
        if (a>b)
            
        {
            tmp=a;
            a=b;
            b=tmp; }
        if (b>c)
        { tmp=b;b=c; c=tmp; }
    }
    
    
    if (a==b&&a==c) {//豹子
        
        self.p4.value = [NSString stringWithFormat:@"6%d%d%d",c,b,a];
        
    }
    else if (num1==num3&&num1==num5) {//顺金 和 金花
        
        if (c==24&&b==13&&a==12) {
            
            self.p4.value = @"5131211";
        }
        if (c-b==1&&b-a==1) {
            
            self.p4.value = [NSString stringWithFormat:@"5%d%d%d",c,b,a];
            
        }else{
            
            self.p4.value = [NSString stringWithFormat:@"4%d%d%d",c,b,a];
            
        }
        
        
    }
    
    else if (c==24&&b==13&&a==12) {//顺子 A23
        self.p4.value = @"3131211";
    }
    else if (c-b==1&&b-a==1) {//顺子其他
        
        self.p4.value = [NSString stringWithFormat:@"3%d%d%d",c,b,a];
        
    }
    else  if (a==b||b==c) {//对子
        if (a==b) {
            self.p4.value = [NSString stringWithFormat:@"2%d%d%d",a,b,c];
        }
        if (c==b) {
            self.p4.value = [NSString stringWithFormat:@"2%d%d%d",c,b,a];
        }
        
    }
    
    
    else{
        
        self.p4.value = [NSString stringWithFormat:@"1%d%d%d",c,b,a];
        
    }
    NSLog(@"%@",self.p4.value);
    
    
    
    
}


- (IBAction)jiesuan:(id)sender {
    
    for (int i =0; i<4; i++) {
        
        Player * p =[self.players objectAtIndex:i];
        //NSLog(@"%d",p.did);
        if (p.did==1) {
            
            for (id a in self.players) {
                
                if (a==p) {
                    break;
                }
                self.n++;
                
            }
            
        }
        p.did = 0;
        
        
    }
    NSLog(@"n=%d",self.n);
    
    int num=0;
    
    for (int i=0; i<4; i++) {
        
        if (i!=self.n) {
            
            Player *p1 = self.players[self.n];
            Player *p2 = self.players[i];
            
            if (p1.value.intValue>p2.value.intValue) {
                
                p1.money+=100*(p1.value.intValue/1000000);
                num++;
                UILabel *lab = self.playmoney[self.n];
                lab.text= [NSString stringWithFormat:@"%d",p1.money];
                NSLog(@"%d",p1.money);
                
                UILabel *lab1 = self.playmoney[i];
                p2.money-=100*(p1.value.intValue/1000000);
                lab1.text = [NSString stringWithFormat:@"%d",p2.money];
                NSLog(@"%d",p2.money);
                p1.red.hidden = YES;
                
            }else{
                p1.money-=100*(p2.value.intValue/1000000);
                UILabel *lab = self.playmoney[self.n];
                lab.text= [NSString stringWithFormat:@"%d",p1.money];
                NSLog(@"%d",p1.money);
                
                UILabel *lab1 = self.playmoney[i];
                p2.money+=100*(p2.value.intValue/1000000);
                lab1.text = [NSString stringWithFormat:@"%d",p2.money];
                NSLog(@"%d",p2.money);
                p1.red.hidden = YES;

                
                
            }
            
            
            
        }
        
        
    }
    
    
    UIAlertController * controller2 = [UIAlertController alertControllerWithTitle:@"此轮结束，请重新开始" message:[NSString stringWithFormat:@"庄家赢%d家牌",num] preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
    [controller2 addAction:cancelAction];
    
    [self presentViewController:controller2 animated:YES completion:nil];
    
   
    
 
}

- (IBAction)restart:(id)sender {
    
    //[self viewDidLoad];
    
    NSArray *tmp1;
    NSArray *tmp2;
    NSArray *tmp3;
    NSArray *tmp4;
    
    tmp1 = @[
             @{@"name":@"club-1",@"value":@"24"},
             @{@"name":@"club-2",@"value":@"12"},
             @{@"name":@"club-3",@"value":@"13"},
             @{@"name":@"club-4",@"value":@"14"},
             @{@"name":@"club-5",@"value":@"15"},
             @{@"name":@"club-6",@"value":@"16"},
             @{@"name":@"club-7",@"value":@"17"},
             @{@"name":@"club-8",@"value":@"18"},
             @{@"name":@"club-9",@"value":@"19"},
             @{@"name":@"club-10",@"value":@"20"},
             @{@"name":@"club-11",@"value":@"21"},
             @{@"name":@"club-12",@"value":@"22"},
             @{@"name":@"club-13",@"value":@"23"}
             ];
    
    tmp2 = @[
             @{@"name":@"spade-1",@"value":@"24"},
             @{@"name":@"spade-2",@"value":@"12"},
             @{@"name":@"spade-3",@"value":@"13"},
             @{@"name":@"spade-4",@"value":@"14"},
             @{@"name":@"spade-5",@"value":@"15"},
             @{@"name":@"spade-6",@"value":@"16"},
             @{@"name":@"spade-7",@"value":@"17"},
             @{@"name":@"spade-8",@"value":@"18"},
             @{@"name":@"spade-9",@"value":@"19"},
             @{@"name":@"spade-10",@"value":@"20"},
             @{@"name":@"spade-11",@"value":@"21"},
             @{@"name":@"spade-12",@"value":@"22"},
             @{@"name":@"spade-13",@"value":@"23"}
             ];
    tmp3 = @[
             @{@"name":@"diamond-1",@"value":@"24"},
             @{@"name":@"diamond-2",@"value":@"12"},
             @{@"name":@"diamond-3",@"value":@"13"},
             @{@"name":@"diamond-4",@"value":@"14"},
             @{@"name":@"diamond-5",@"value":@"15"},
             @{@"name":@"diamond-6",@"value":@"16"},
             @{@"name":@"diamond-7",@"value":@"17"},
             @{@"name":@"diamond-8",@"value":@"18"},
             @{@"name":@"diamond-9",@"value":@"19"},
             @{@"name":@"diamond-10",@"value":@"20"},
             @{@"name":@"diamond-11",@"value":@"21"},
             @{@"name":@"diamond-12",@"value":@"22"},
             @{@"name":@"diamond-13",@"value":@"23"}
             ];
    tmp4 = @[
             @{@"name":@"heart-1",@"value":@"24"},
             @{@"name":@"heart-2",@"value":@"12"},
             @{@"name":@"heart-3",@"value":@"13"},
             @{@"name":@"heart-4",@"value":@"14"},
             @{@"name":@"heart-5",@"value":@"15"},
             @{@"name":@"heart-6",@"value":@"16"},
             @{@"name":@"heart-7",@"value":@"17"},
             @{@"name":@"heart-8",@"value":@"18"},
             @{@"name":@"heart-9",@"value":@"19"},
             @{@"name":@"heart-10",@"value":@"20"},
             @{@"name":@"heart-11",@"value":@"21"},
             @{@"name":@"heart-12",@"value":@"22"},
             @{@"name":@"heart-13",@"value":@"23"}
             ];
    
    self.arr1 = [[NSMutableArray alloc]initWithArray:tmp1];
    self.arr2 = [[NSMutableArray alloc]initWithArray:tmp2];
    self.arr3 = [[NSMutableArray alloc]initWithArray:tmp3];
    self.arr4 = [[NSMutableArray alloc]initWithArray:tmp4];
    
    
    self.array = @[self.arr1,self.arr2,self.arr3,self.arr4];
    
    
    [self initTheGame];
    
    //[self creatPlayer];
    
    [self startTheGame];
    

    
    
    
}




@end
