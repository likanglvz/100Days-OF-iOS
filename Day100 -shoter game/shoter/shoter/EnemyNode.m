//
//  EnemyNode.m
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "EnemyNode.h"
#import "PhysicsCategorise.h"
#import "Geometry.h"


@implementation EnemyNode

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.name = [NSString stringWithFormat:@"Enemy %p",self];
        [self initNodeGraph];
        
        [self initPhysiceBody];
        
    }
    return self;
    
}

-(void)initPhysiceBody{
    
    SKPhysicsBody *body = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(40, 40)];
    body.affectedByGravity = NO;
    body.categoryBitMask = EnemyCategory;
    body.contactTestBitMask = EnemyCategory|PlayerMissileCategory;
    body.mass = 0.2;
    body.angularDamping = 0.0f;
    body.linearDamping = 0.0f;
    self.physicsBody = body;
    
    
    
}


-(void)initNodeGraph{
    
    SKLabelNode *topRow = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    
    topRow.fontColor = [SKColor brownColor];
    topRow.fontSize = 20;
    topRow.text = @"x x";
    topRow.position = CGPointMake(0, 15);
    [self addChild:topRow];
    
    
    SKLabelNode *middleRow = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    middleRow.fontColor = [SKColor brownColor];
    middleRow.fontSize = 20;
    middleRow.text = @"x";
    [self addChild:middleRow];
    
    SKLabelNode *bottomRow = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    bottomRow.fontColor = [SKColor brownColor];
    bottomRow.fontSize = 20;
    bottomRow.text = @"x x";
    bottomRow.position = CGPointMake(0, -15);
    [self addChild:bottomRow];
  
}


-(void)receiveAttacker:(SKNode *)attacker contact:(SKPhysicsContact *)contact{
    
    self.physicsBody.affectedByGravity = YES;
    
    CGVector force = VectorMultiply(attacker.physicsBody.velocity,contact.collisionImpulse);
    
    CGPoint myContact = [self.scene convertPoint:contact.contactPoint toNode:self];
    
    [self.physicsBody applyForce:force atPoint:myContact];
   
    
    
}

-(void)friendlyBumpFrom:(SKNode *)node{
    
     self.physicsBody.affectedByGravity = YES;
}




@end
