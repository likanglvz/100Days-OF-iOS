//
//  BulletNode.m
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "BulletNode.h"
#import "PhysicsCategorise.h"
#import "Geometry.h"
#import <AVFoundation/AVFoundation.h>

@interface BulletNode()<AVAudioPlayerDelegate>

@property(assign,nonatomic) CGVector thrust;
@property(nonatomic,strong) AVAudioPlayer *audioPlayer;

@end



@implementation BulletNode

-(instancetype)init{
    
    if (self=[super init]) {
        
        SKLabelNode *dot = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        dot.fontColor = [SKColor blackColor];
        dot.fontSize = 40;
        dot.text = @".";
        [self addChild:dot];
        
        NSBundle *mainbundle = [NSBundle mainBundle];
        NSString *filepath = [mainbundle pathForResource:@"1" ofType:@"wav"];
        
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

        
        
        SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius:1];
        body.dynamic = YES;
        body.categoryBitMask = PlayerMissileCategory;
        body.contactTestBitMask = EnemyCategory;
        body.collisionBitMask = EnemyCategory;
        body.mass = 0.01;
        
        self.physicsBody = body;
        self.name = [NSString stringWithFormat:@"Bullet %p",self];
    
    }
    
    return self;
    
}

+(instancetype)bulletFrom:(CGPoint)start toward:(CGPoint)destination{
    
    BulletNode *bullet = [[self alloc]init];
    bullet.position = start;
    
    CGVector movement = VectorBetweenPoints(start,destination);
    CGFloat magnitude = VectorLength(movement);
    
    if (magnitude ==0.0f) {
        
        return nil;
        
    }
    CGVector scaledMovement = VectorMultiply(movement,1/magnitude);
    
    CGFloat thrustMagnitude = 100.0;
    
    bullet.thrust = VectorMultiply(scaledMovement,thrustMagnitude);
    
    
    
    return bullet;
 
}

//它推动无力形体发射，每一帧都会调用
-(void)applyRecurringForce{
    
    [self.physicsBody applyForce:self.thrust];
    
    

    
    
}






















@end
