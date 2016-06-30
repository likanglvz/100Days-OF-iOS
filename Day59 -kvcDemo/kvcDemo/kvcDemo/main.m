//
//  main.m
//  kvcDemo
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "GirlFriend.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        Student * student = [[Student alloc]init];

        [student setValue:@3 forKey:@"age"];
        NSLog(@"%ld",[[student valueForKey:@"age"]integerValue]);
      
        [student setValue:@"张三" forKey:@"name"];
        NSLog(@"%@",[student valueForKey:@"name"]);
        
        
        GirlFriend * girl = [[GirlFriend alloc]init];
        [girl setValue:@"杨玉环" forKey:@"girlFriendName"];
        
        //键路径访问属性
        [student setValue:girl forKey:@"girlFriend"];
        NSString * girlFriendName = [student valueForKeyPath:@"girlFriend.girlFriendName"];
        NSLog(@"女朋友名字 %@",girlFriendName);
        
        
        //通过键路径设置姓名
        [student setValue:@"王昭君" forKeyPath:@"girlFriend.girlFriendName"];
        girlFriendName = [student valueForKeyPath:@"girlFriend.girlFriendName"];
         NSLog(@"女朋友名字 %@",girlFriendName);
        
        //通过键路径设置年龄
        [student setValue:@22 forKeyPath:@"girlFriend.age"];
        NSNumber * age = [student valueForKeyPath:@"girlFriend.age"];
        NSLog(@"女朋友年龄 %ld",(long)[age integerValue]);
        
        
        
        GirlFriend * girl1 = [[GirlFriend alloc]init];
        GirlFriend * girl2 = [[GirlFriend alloc]init];
        GirlFriend * girl3 = [[GirlFriend alloc]init];
        
        [girl1 setValue:@23 forKey:@"age"];
        [girl2 setValue:@42 forKey:@"age"];
        [girl3 setValue:@18 forKey:@"age"];
        
        
        [girl1 setValue:@"西施" forKey:@"girlFriendName"];
        [girl2 setValue:@"貂蝉" forKey:@"girlFriendName"];
        [girl3 setValue:@"西施" forKey:@"girlFriendName"];
        
        
        NSArray * array = @[girl1,girl2,girl3];
        //设置数组属性
        [student setValue:array forKey:@"meetingList"];
        
        //返回所有年龄
        NSLog(@"%@",[student valueForKeyPath:@"meetingList.age"]);
        //个数
        NSLog(@"%@",[student valueForKeyPath:@"meetingList.@count"]);
        
        //最大年龄
        NSLog(@"%@",[student valueForKeyPath:@"meetingList.@max.age"]);
        //最小年龄
        NSLog(@"%@",[student valueForKeyPath:@"meetingList.@min.age"]);
        //平均
        NSLog(@"%@",[student valueForKeyPath:@"meetingList.@avg.age"]);
        
        
        id arr = [student valueForKey:@"Mgen"];
        NSLog(@"%@",[arr class]);
        NSLog(@"%@",[arr objectAtIndex:1]);
        
        
        //KVO girl1观察 student中name1属性的改变。
        [student addObserver:girl1 forKeyPath:@"name1" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld  context:NULL];
        
        student.name1 = @"叫兽";
        
        [student removeObserver:girl1 forKeyPath:@"name1"];
        
    }
    return 0;
}
