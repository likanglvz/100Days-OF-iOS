//
//  GameScene.h
//  shoter
//

//  Copyright (c) 2016年 李康. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

//第几关
@property(assign,nonatomic) NSUInteger levelNumber;
//几条命
@property(assign,nonatomic) NSInteger playerlives;
//某关是否完成
@property(assign,nonatomic) BOOL finished;

+(instancetype)sceneWithSize:(CGSize)size levelNumber:(NSInteger)levelNumbers;






@end
