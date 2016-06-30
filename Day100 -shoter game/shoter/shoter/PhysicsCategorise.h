//
//  PhysicsCategorise.h
//  shoter
//
//  Created by 李康 on 16/6/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#ifndef PhysicsCategorise_h
#define PhysicsCategorise_h


typedef NS_OPTIONS(uint32_t,PhysicsCategory){
    PlayerCategory  = 1<<1,
    EnemyCategory   = 1<<2,
    PlayerMissileCategory =1<<3
   
};





#endif /* PhysicsCategorise_h */
