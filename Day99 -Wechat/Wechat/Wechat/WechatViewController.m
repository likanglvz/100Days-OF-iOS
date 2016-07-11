//
//  ViewController.m
//  Wechat
//
//  Created by 李康 on 16/6/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "WechatViewController.h"

@interface WechatViewController ()<AsyncUdpSocketDelegate>

@end

@implementation WechatViewController
- (IBAction)sendClick:(id)sender {
    
    NSString *messageStr = self.messageTextField.text;
    //发送消息
    [self sendMessage:messageStr];
    
    self.messageTextField.text = @"";
    
    [self.messageTextField resignFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //打印ip地址
    self.myIP = [self deviceIPAdress];
    NSLog(@"my ip :%@",self.myIP);
    
    //初始化工作
    self.chatArray = [[NSMutableArray alloc]init];
    self.lastTime = [NSDate date];
    
    
    
    
    
    
    
}


-(NSString *)deviceIPAdress{
    
     InitAddresses();
     GetIPAddresses();
     GetHWAddresses();
    
    return [NSString stringWithFormat:@"%s",ip_names[1]];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self openUDPServer];
    [self.chatTableView reloadData];
 
}

-(void)openUDPServer{
    //初始化UDP
    self.udpSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    
    NSError *error;
    //绑定端口
    [self.udpSocket bindToPort:4333 error:&error];
    
    //加入组播
    [self.udpSocket joinMulticastGroup:@"224.0.0.2" error:&error];
    
    //启动接受线程
    [self.udpSocket receiveWithTimeout:-1 tag:0];
    
    
}

-(void)sendMessage:(NSString *)messgae{//通过UDP发送消息
    
    NSDate  *nowTime = [NSDate date];
    //调用udp socket 发送数据
    BOOL res = [self.udpSocket sendData:[messgae dataUsingEncoding:NSUTF8StringEncoding] toHost:@"224.0.0.2" port:4333 withTimeout:-1 tag:0];
    
    if (!res) {
        
        //弹出警告框...
        return;
    
    }
    if ([self.chatArray lastObject] == nil) {
        
        self.lastTime = nowTime;
        //将最后时间保存下来
        [self.chatArray addObject:nowTime];
        
        
    }
    //取当前发送消息的时间和上一次保存时间的间隔
    NSTimeInterval timeInterval = [nowTime timeIntervalSinceDate:self.lastTime];
    
    if (timeInterval>5) {
        
        self.lastTime = nowTime;
        
        [self.chatArray addObject:nowTime];
        
    }
    
    NSString *title = [NSString stringWithFormat:@"我说：%@",messgae];
    //数组中 聊天记录的保存
    [self.chatArray addObject:@{@"text":title,@"speaker":@"self",@"fromSelf":@YES}];
    
    [self.chatTableView reloadData];
    
    
}

-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    
    [self.udpSocket receiveWithTimeout:-1 tag:0];
    
    NSLog(@"host %@",host);
    
    //收到自己的消息，返回
    if ([host isEqualToString:self.myIP]) {
        
        return YES;
        
    }
    //收到data转字符串
    NSString *info = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString *title = [NSString stringWithFormat:@"%@说%@",host,info];
    //插入标签记录
    [self.chatArray addObject:@{@"text":title,@"speaker":@"other",@"fromSelf":@NO}];
    
    [self.chatTableView reloadData];
    
    return YES;
    
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error{
    
    //发送数据失败
    
    
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotReceiveDataWithTag:(long)tag dueToError:(NSError *)error{
    //接受数据失败
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.chatArray count];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //判断此对象是否为时间类型
    if ([[self.chatArray objectAtIndex:indexPath.row] isKindOfClass:[NSDate class]]) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yy-MM-d HH:mm"];
        
        NSString *timeString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:self.chatArray[indexPath.row]]];
        
        cell.textLabel.text = timeString;
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        
    }else{//聊天记录
        NSDictionary *charInfo = self.chatArray[indexPath.row];
        
        BOOL fromSelf = [charInfo[@"fromSelf"]boolValue];
        
        if (fromSelf) {
            
            cell.textLabel.textAlignment = NSTextAlignmentRight;
            
            cell.textLabel.backgroundColor = [UIColor yellowColor];
            
            cell.imageView.image = [UIImage imageNamed:@"me.png"];
         
            
        }else{
            
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            
            cell.textLabel.backgroundColor = [UIColor greenColor];
            
            cell.imageView.image = [UIImage imageNamed:@"other.png"];
 
            
        }
        
         cell.textLabel.text = charInfo[@"text"];

    }
    
    
    
    return cell;
    
}






















@end
