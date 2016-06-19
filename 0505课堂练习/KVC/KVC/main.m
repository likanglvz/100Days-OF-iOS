//
//  main.m
//  KVC
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "GirlFriend.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *s1 = [[Student alloc]init];
        
        [s1 setValue:@3 forKey:@"age"];
        NSLog(@"%ld",[[s1 valueForKey:@"age"]integerValue]);
    
        [s1 setValue:@"张三" forKey:@"name"];
        NSLog(@"%@",[s1 valueForKey:@"name"]);
    
        GirlFriend *g = [[GirlFriend alloc]init];
        [g setValue:@"Amber" forKey:@"girlFriendName"];
        
        [s1 setValue:g forKey:@"girlFriend"];
        NSString *girlFriendName = [s1 valueForKeyPath:@"girlFriend.girlFriendName"];
        NSLog(@"女朋友名字：%@",girlFriendName);
        
    
        //通过建路径设置属性
        [s1 setValue:@"王八蛋" forKeyPath:@"girlFriend.girlFriendName"];
        girlFriendName = [s1 valueForKeyPath:@"girlFriend.girlFriendName"];
        NSLog(@"女朋友名字：%@",girlFriendName);
        

        [s1 setValue:@23 forKeyPath:@"girlFriend.age"];
        int age = [[s1 valueForKeyPath:@"girlFriend.age"]intValue];
        NSLog(@"女朋友的年龄是:%d",age);
        
        
        GirlFriend *girl1= [[GirlFriend alloc]init];
        GirlFriend *girl2= [[GirlFriend alloc]init];
        GirlFriend *girl3= [[GirlFriend alloc]init];

        [girl1 setValue:@24 forKey:@"age"];
        [girl2 setValue:@25 forKey:@"age"];
        [girl3 setValue:@26 forKey:@"age"];

        [girl1 setValue:@"路人甲" forKey:@"girlFriendName"];
        [girl2 setValue:@"路人乙" forKey:@"girlFriendName"];
        [girl3 setValue:@"路人丙" forKey:@"girlFriendName"];

        NSArray *array = @[girl1,girl2,girl3];
        [s1 setValue:array forKey:@"meetingList"];
        //返回数组中所有年龄
        NSLog(@"%@",[s1 valueForKeyPath:@"meetingList.age"]);
        //个数
        NSLog(@"数组中元素个数：%@",[s1 valueForKeyPath:@"meetingList.@count"]);
        //@max.age
        NSLog(@"所有年龄中的最大值：%@",[s1 valueForKeyPath:@"meetingList.@max.age"]);
        NSLog(@"所有年龄中的最小值：%@",[s1 valueForKeyPath:@"meetingList.@min.age"]);
        NSLog(@"所有年龄的平均值：%@",[s1 valueForKeyPath:@"meetingList.@avg.age"]);

        
        id arr = [s1 valueForKey:@"Mgen"];
        NSLog(@"%@",arr);
        NSLog(@"%@",arr[2]);
        
        //kvo:girl1观察s1中 name1属性的改变。
        
        [s1 addObserver:girl1 forKeyPath:@"name1" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        s1.name1 = @"教授";
        [s1 removeObserver:girl1 forKeyPath:@"name1"];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
