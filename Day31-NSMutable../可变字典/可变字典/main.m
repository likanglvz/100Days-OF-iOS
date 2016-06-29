//
//  main.m
//  可变字典
//
//  Created by 李康 on 16/4/6.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    NSDictionary *dic = @{@99:@"张三",@3:@"李四",@7:@"王王"};
    NSMutableDictionary *dic1 = [NSMutableDictionary new];
    dic1[@10] = @"老王";
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"key=%@,value=%@",key,obj);
//        NSLog(@"key=%@,value=%@",key,[dic objectForKey:key]);
        NSLog(@"key=%@,value=%@",key,dic[key]);
        if ([obj isEqualToString:@"张三"]) {
            *stop = YES;
        }
    }];
    
}
int test(int argc, const char * argv[]) {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    [dic setObject:@"治世之能臣，乱世之奸雄" forKey:@"曹操"];
    [dic setObject:@"智慧之化身，后世之典范" forKey:@"孔明"];
    [dic setObject:@"托孤于孔明，知人且善任" forKey:@"刘备"];
    [dic setObject:@"托孤于孔明，知人且善任1" forKey:@"刘备"];
    [dic removeObjectForKey:@"刘备"];
    NSArray *keys = [dic allKeys];
    
    for (id tmp in keys) {
        NSLog(@"%@:%@",tmp,[dic objectForKey:tmp]);
    }
    
    return 0;
}
