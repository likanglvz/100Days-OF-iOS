//
//  BulletNode.h
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BulletNode : SKNode

+(instancetype)bulletFrom:(CGPoint)start toward:(CGPoint)destination;

-(void)applyRecurringForce;



@end
