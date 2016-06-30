//持久化



//  Persistence.m
//  GCD和COREDATA的联合使用
//
//  Created by 李康 on 16/5/23.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence

-(instancetype)init{
    
    self= [super init];
    
    if (self) {
        
        //数据模型路径
        NSURL *modelURL = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
        
        //初始化 托管对象模型
        _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
        
        
        NSURL *storeURL = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"multiCoreDataDemo.sqlite"];
        //如果数据库存在，则删除（举例）
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm removeItemAtURL:storeURL error:nil];
        
        NSError * error = nil;
        
        //创建出久化存储协调器
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
        
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            
            NSLog(@"%@",error);
            abort();
            
        }
        
        
        
        
        
        
    }
    return self;
}

-(NSURL *)applicationDocumentsDirectory{
    
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    
}


//创建托管对象上下文
-(NSManagedObjectContext *)createManagedObjectContext{
    
    NSManagedObjectContext * managedObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    
    [managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
 
    return managedObjectContext;
}





@end
