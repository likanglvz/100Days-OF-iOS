//
//  GameScene.m
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright (c) 2016年 李康. All rights reserved.
//

#import "GameScene.h"
#import "PlayerNode.h"
#import "EnemyNode.h"
#import "BulletNode.h"
#import "SKNode+Extra.h"



#define ARC4RANDOM_MAX 0x100000000

@interface GameScene()<SKPhysicsContactDelegate>

@property(strong,nonatomic) PlayerNode *playerNode;
@property(strong,nonatomic) SKNode *enemies;
@property(strong,nonatomic) SKNode *playerBullets;

@end



@implementation GameScene

+(instancetype)sceneWithSize:(CGSize)size levelNumber:(NSInteger)levelNumbers{
    
    return [[self alloc]initWithSize:size levelNumber:levelNumbers];
}

-(void)spawnEnemies{
    
    NSUInteger count = log(self.levelNumber)+self.levelNumber;
    for (NSUInteger i=0; i<count; i++) {
        
        EnemyNode * enemy = [EnemyNode node];
        CGSize size = self.frame.size;
        
        CGFloat x =(size.width*0.8*arc4random()/ARC4RANDOM_MAX)+(size.width*0.1);
        
        CGFloat y =(size.height*0.5*arc4random()/ARC4RANDOM_MAX)+(size.height*0.5);
        
        enemy.position = CGPointMake(x, y);
        
        [self.enemies addChild:enemy];
  
    }
    
    
}





-(instancetype)initWithSize:(CGSize)size{
    
    return [self initWithSize:size levelNumber:1];
}

-(instancetype)initWithSize:(CGSize)size levelNumber:(NSInteger)levelNumbers{
    
    if (self = [super initWithSize:size]) {
        
        _levelNumber = levelNumbers;
        _playerlives = 5;
        
        //场景背景
        self.backgroundColor = [SKColor whiteColor];
        
        //初始化标签节点
        SKLabelNode *lives = [SKLabelNode labelNodeWithText:@"Courier"];
        //设置标签字体，颜色，名称，位置，对齐方式
        lives.fontSize = 16;
        lives.fontColor = [SKColor blackColor];
        lives.name = @"LivesLabel";
        lives.text = [NSString stringWithFormat:@"Lives:%lu",(unsigned long)_playerlives];
        lives.verticalAlignmentMode = SKLabelVerticalAlignmentModeTop;
        lives.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
        lives.position = CGPointMake(self.frame.size.width, self.frame.size.height);
        [self addChild:lives];
        
        SKLabelNode *level = [SKLabelNode labelNodeWithText:@"Courier"];
        level.fontSize = 16;
        level.fontColor = [SKColor blackColor];
        level.name = @"LevelLabel";
        level.text = [NSString stringWithFormat:@"Level:%lu",(unsigned long)_levelNumber];
        level.verticalAlignmentMode = SKLabelVerticalAlignmentModeTop;
        level.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        level.position = CGPointMake(0, self.frame.size.height);
        [self addChild:level];
  
        //创建新节点
        self.playerNode = [PlayerNode node];
        
        self.playerNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame)*0.1);
        [self addChild:_playerNode];
        
        self.enemies = [SKNode node];
        
        [self addChild: self.enemies];
        
        [self spawnEnemies];
        
        
        self.playerBullets = [SKNode node];
        [self addChild:self.playerBullets];
        
        
        self.physicsWorld.gravity = CGVectorMake(0, -1);
        
        self.physicsWorld.contactDelegate = self;

        
    }
    
    
    return self;
    
}






//呈现场景是调用
-(void)didMoveToView:(SKView *)view {
//    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 45;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
    
    
    
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    for (UITouch *touch  in touches) {
        
        //点击位置
        CGPoint location = [touch locationInNode:self];
        if (location.y<CGRectGetHeight(self.frame)*0.2) {
            //x坐标更具点击位置变换，y不动
            CGPoint target = CGPointMake(location.x, self.playerNode.position.y);
            CGFloat duration = [self.playerNode moveToward:target];
            
        }else{
            
            
            BulletNode *bullet = [BulletNode bulletFrom:self.playerNode.position toward:location];
            
            if (bullet) {
                [self.playerBullets addChild:bullet];
            }
            
            
        }
        
        
    }
  
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (self.finished) {
        
        return;
    }
   
    [self updateBullets];
    [self updateEnemies];
    [self checkForNextLevel];
    
    
   
}


-(void)checkForNextLevel{
    
    if ([self.enemies.children count]==0) {
        [self goToNextLevel];
    }
    
}

-(void)goToNextLevel{
    
    self.finished = YES;
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    label.text = @"Level Complete";
    label.fontColor = [SKColor blueColor];
    label.fontSize = 32;
    label.position = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    
    [self addChild:label];
    
    GameScene *nextlevel = [[GameScene alloc]initWithSize:self.frame.size levelNumber:self.levelNumber+1];
    nextlevel.playerlives = self.playerlives;
    [self.view presentScene:nextlevel transition:[SKTransition flipHorizontalWithDuration:1.0]];
    
    
    
}



-(void)updateBullets{
    
    NSMutableArray *bulletsToremove = [NSMutableArray array];
    
    for ( BulletNode *bullet in self.playerBullets.children) {
        
        if (!CGRectContainsPoint(self.frame, bullet.position)) {
            
            [bulletsToremove addObject:bullet];
            continue;
            
        }
        [bullet applyRecurringForce];
   
    }
    
    [self.playerBullets removeChildrenInArray:bulletsToremove];
    
    
}


-(void)updateEnemies{
    
    NSMutableArray *enemiesToRemove = [NSMutableArray array];
    
    for (SKNode *node in self.enemies.children) {
        
        if (!CGRectContainsPoint(self.frame, node.position)) {
            
            [enemiesToRemove addObject:node];
            continue;
            
        }
    }if ([enemiesToRemove count]>0) {
        [self.enemies removeChildrenInArray:enemiesToRemove];
    }
    
    
    
}


-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    if (contact.bodyA.categoryBitMask == contact.bodyB.categoryBitMask) {
        
        SKNode *nodeA = contact.bodyA.node;
        
        SKNode *nodeB = contact.bodyB.node;
        
        [nodeA friendlyBumpFrom:nodeB];
        
        [nodeB friendlyBumpFrom:nodeA];
        
    }else{
        
        SKNode *attacker = nil;
        
        SKNode *attackee = nil;
        
        if (contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask) {
            
            attacker = contact.bodyA.node;
            
            attackee = contact.bodyB.node;
            
        }else{
            
            attacker = contact.bodyB.node;
            
            attackee = contact.bodyA.node;
            
        }
        if ([attackee isKindOfClass:[PlayerNode class]]) {
            
            self.playerlives--;
        }
        
        if (attacker) {
            
            [attackee receiveAttacker:attacker contact:contact];
            
            [self.playerBullets removeChildrenInArray:@[attacker]];
            
            [self.enemies removeChildrenInArray:@[attacker]];
            
            
        }
        
        
        
    }
    
    
    
}

















@end
