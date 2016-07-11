//
//  SKNode+Extra.h
//  shoter
//
//  Created by 李康 on 16/6/2.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKNode (Extra)

-(void)receiveAttacker:(SKNode *)attacker contact:(SKPhysicsContact *)contact;

-(void)friendlyBumpFrom:(SKNode *)node;


@end
