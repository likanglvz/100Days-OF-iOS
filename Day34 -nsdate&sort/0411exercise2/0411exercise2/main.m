//
//  main.m
//  0411exercise2
//
//  Created by AppleUser on 16/4/11.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSArray * germanMakes = @[@"Mercedes-Benz",@"BMW",@"Porsche",@"Opel",@"Volkswagen",@"Audi"];
    NSArray * ukMakes = [NSArray arrayWithObjects:@"Aston Martin",@"Lotus",@"Jaguar",@"Bentley",nil];
        
    for (id tmp in germanMakes) {
        NSLog(@"%@",tmp);
    }
       NSLog(@"");
    for (int i=0; i<ukMakes.count; i++) {
        NSLog(@"i:%d,%@",i,ukMakes[i]);
    }
       NSLog(@"");
   
    NSEnumerator *enu=[germanMakes objectEnumerator];
    NSNumber *n;
    while (n=[enu nextObject]) {
        NSLog(@"%@",n);
    }
      NSLog(@"");
    [germanMakes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%lu,%@",idx,obj);
    }];
    NSLog(@"");
    
//    NSComparator cmptr = ^(id obj1, id obj2){
//        
//        if ([obj1 integerValue]>[obj2 integerValue]) {
//            return (NSComparisonResult)NSOrderedDescending;
//            
//        }
//        if ([obj1 integerValue]<[obj2 integerValue]) {
//            return NSOrderedAscending;
//            
//        }
//        
//        return NSOrderedSame;
//        
//    };
//    NSArray *new=[germanMakes sortedArrayUsingComparator:cmptr];
//  
//    NSLog(@"%@",new);
        NSArray *result=[germanMakes sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 length]>[obj2 length]) {
            return NSOrderedAscending;
        }
        if ([obj1 length]<[obj2 length]) {
            return NSOrderedDescending;
        }
        else
            return NSOrderedSame;
    }];
    for (id tmp in result) {
        NSLog(@"排序结果%@",tmp);
    }
    NSLog(@"");
    //谓词过滤 车名在N 之前
    NSPredicate *pre;
    pre=[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSComparisonResult result=[@"N" compare:evaluatedObject];
        if (result==NSOrderedDescending) {
            return  YES;
        }else
            return NO;
    }];
    NSArray *resuly1=[germanMakes filteredArrayUsingPredicate:pre];
    NSLog(@"%@",resuly1);
    
    NSLog(@"");
    NSDictionary *car1= @{@"make":@"Volkswagen",@"model":@"Golf",@"price":@"18700"};
    NSDictionary *car2= @{@"make":@"Volkswagen",@"model":@"Eos",@"price":@"35800"};
    NSDictionary *car3= @{@"make":@"Volkswagen",@"model":@"Jatta A5",@"price":@"16670"};
    NSDictionary *car4= @{@"make":@"Volkswagen",@"model":@"Jatta A4",@"price":@"16670"};
    
    NSMutableArray * cars=[NSMutableArray arrayWithObjects:car1,car2,car3,car4,nil];
    
    //1.（根据价格  排序 ）   2.（  根据价格和型号 排序  先价格 价格相同时 型号排序）
    
    
    
    NSSortDescriptor *des=[[NSSortDescriptor alloc]initWithKey:@"price" ascending:YES];
NSSortDescriptor *des1=[[NSSortDescriptor alloc]initWithKey:@"model" ascending:YES];
    NSArray *new2=[[cars sortedArrayUsingDescriptors:@[des]]sortedArrayUsingDescriptors:@[des1]];
    for (id tmp in new2) {
        NSLog(@"%@",tmp);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
