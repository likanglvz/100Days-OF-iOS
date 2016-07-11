//
//  ViewController.m
//  avPlayer
//
//  Created by 李康 on 16/5/31.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>



@interface ViewController ()<AVAudioPlayerDelegate>

@property(nonatomic,strong) AVAudioPlayer *audioPlayer;
@property(nonatomic,strong) AVAudioRecorder *audioRecorder;




@end

@implementation ViewController
- (IBAction)play:(id)sender {
    NSBundle *mainbundle = [NSBundle mainBundle];
    NSString *filepath = [mainbundle pathForResource:@"1" ofType:@"mp3"];
    
    //读入文件
    NSData *fileData = [NSData dataWithContentsOfFile:filepath];
    
    NSError *error;
    //初始化音频播放器
    self.audioPlayer = [[AVAudioPlayer alloc]initWithData:fileData error:&error];
    
    if (self.audioPlayer!=nil) {
        
        self.audioPlayer.delegate = self;
        //准备，并开始播放
        if ([self.audioPlayer prepareToPlay]&&[self.audioPlayer play]) {
            
            // 开始播放
            
        }else{
            
            //播放失败
        }
        
    }
    
    
    
}
- (IBAction)pause:(id)sender {
    
    [self.audioPlayer pause];
    
}
- (IBAction)stop:(id)sender {
    
    [self.audioPlayer stop];
    self.audioPlayer=nil;
    
}

- (IBAction)continueplay:(id)sender {
    
    [self.audioPlayer play];
}
- (IBAction)record:(id)sender {
    
    //录制文件存放位置
    NSURL *documentURL = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    
    NSURL *destinationURL = [documentURL URLByAppendingPathComponent:@"RecordedSound.wav"];
    
    NSLog(@"%@",[destinationURL path]);
    
    NSError *error;
    
    //录音的设置
    NSDictionary *setting = @{
                              
                              AVSampleRateKey:@(1000.0)//采样率
                              
                              };
    
    
    self.audioRecorder = [[AVAudioRecorder alloc]initWithURL:destinationURL settings:setting error:&error];
    
    
    if (error) {
        //错误处理
    }
    
    
    [self.audioRecorder prepareToRecord];
    
    [self.audioRecorder record];
 
    
}
- (IBAction)recorestop:(id)sender {
    
    [self.audioRecorder stop];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
