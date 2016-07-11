//
//  ViewController.h
//  Wechat
//
//  Created by 李康 on 16/6/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"
#import "IPAddress.h"


@interface WechatViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

//消息字符串
@property (strong,nonatomic) NSString *messageString;

@property (strong,nonatomic) AsyncUdpSocket *udpSocket;

@property(strong,nonatomic) NSString *myIP;

@property(strong,nonatomic) NSDate *lastTime;

@property(strong,nonatomic) NSMutableArray *chatArray;

-(void) openUDPServer;
-(NSString *)deviceIPAdress;
-(void)sendMessage:(NSString *)messgae;


@end

