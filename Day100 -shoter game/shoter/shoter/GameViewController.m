//
//  GameViewController.m
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright (c) 2016年 李康. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.获得skview实例  skview是一个显示sprite kit内容的视图，内容是由SKScene提供
    SKView * skView = (SKView *)self.view;
    //显示帧速率，显示节点个数
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    //渲染次序，兄弟姐妹关系是影响绘制次序
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    //创建游戏场景 1.用代码 2.使用场景文件 
   // GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    
    GameScene *scene = [GameScene sceneWithSize:self.view.frame.size levelNumber:1];
    
    
    //场景缩放模式
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene. 呈现场景
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
