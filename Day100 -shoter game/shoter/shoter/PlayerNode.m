//
//  PlayerNode.m
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "PlayerNode.h"
#import "Geometry.h"
#import "PhysicsCategorise.h"


@implementation PlayerNode

-(instancetype)init{
    
    if (self = [super init]) {
        self.name = [NSString stringWithFormat:@"Player %p",self];
        [self initNodeGraph];
        
        [self initPhysiceBody];
    }
    
    return self;
    
}

-(void)initPhysiceBody{
    
    SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(20, 20)];
    body.affectedByGravity = NO;
    body.categoryBitMask = PlayerMissileCategory;
    body.contactTestBitMask = EnemyCategory;
    body.collisionBitMask = 0;
    self.physicsBody = body;
    
    
    
}
-(void)initNodeGraph{
    
    SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
    label.fontColor = [SKColor darkGrayColor];
    label.fontSize = 40;
    label.text = @"V";
    label.zRotation = M_PI;
    label.name = @"label";
    
    [self addChild:label];
    
    
}
-(CGFloat)moveToward:(CGPoint)location{
    [self removeActionForKey:@"movement"];
    [self removeActionForKey:@"wobbling"];
    
    CGFloat distance = PointDistance(self.position,location);
    //屏幕宽度
    CGFloat pixels = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration = 2.0*distance/pixels;
    
    [self runAction:[SKAction moveTo:location duration:duration] withKey:@"movement"];
    
    
    CGFloat wobbleTime = 0.3;
    CGFloat halfWobbleTime = wobbleTime*0.5;
    SKAction *wobbling = [SKAction sequence:@[[SKAction scaleXTo:0.2 duration:halfWobbleTime],
                                              [SKAction scaleXTo:1.0 duration:halfWobbleTime]
                                              ]];
    
    NSUInteger wobbleCount = duration/wobbleTime;
    
    [self runAction:[SKAction repeatAction:wobbling count:wobbleCount] withKey:@"wobbling"];
 
    return duration;
    
}






@end
