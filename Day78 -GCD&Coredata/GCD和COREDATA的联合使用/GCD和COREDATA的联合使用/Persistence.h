//
//  Persistence.h
//  GCD和COREDATA的联合使用
//
//  Created by 李康 on 16/5/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Persistence : NSObject


@property(strong,readonly,nonatomic) NSManagedObjectModel *managedObjectModel;
@property(strong,readonly,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(NSManagedObjectContext *)createManagedObjectContext;


@end
