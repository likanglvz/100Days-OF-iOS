//
//  main.m
//  0505第二个KVC
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "GirlFriend.h"
int main(int argc, const char * argv[]) {
       @autoreleasepool {
              Student * student = [[Student alloc]init];
              [student setValue:@3 forKey:@"age"];
              NSLog(@"%ld",[[student valueForKey:@"age"]integerValue]);
              
              [student setValue:@"徐海乔" forKey:@"name"];
              NSLog(@"%@",[student valueForKey:@"name"] );
              
              
              GirlFriend * girl = [[GirlFriend alloc]init];
              [girl setValue:@"杨玉环" forKey:@"girlFriendName"];
              [student setValue:girl forKey:@"girlFriend"];
              
              
              NSString * girlFriendName = [student valueForKeyPath:@"girlFriend.girlFriendName"];
              NSLog(@"%@",girlFriendName);
              
              
              [student setValue:@"王昭君" forKeyPath:@"girlFriend.girlFriendName"];
              NSString * girlFriendName1 = [student valueForKeyPath:@"girlFriend.girlFriendName"];
              NSLog(@"%@",girlFriendName1);
              
              
              [student setValue:@34 forKeyPath:@"girlFriend.age"];
              int a=[[student valueForKeyPath:@"girlFriend.age"]intValue];
              NSLog(@"%d",a);
              
              GirlFriend * girl1 = [[GirlFriend alloc]init];
              GirlFriend * girl2 = [[GirlFriend alloc]init];
              GirlFriend * girl3 = [[GirlFriend alloc]init];
              
              [girl1 setValue:@34 forKey:@"age"];
              [girl2 setValue:@640 forKey:@"age"];
              [girl3 setValue:@2000 forKey:@"age"];
              
              [girl1 setValue:@"西施" forKey:@"girlFriendName"];
              [girl2 setValue:@"貂蝉" forKey:@"girlFriendName"];
              [girl3 setValue:@"闭月羞花" forKey:@"girlFriendName"];
              
              NSArray * array = @[girl1,girl2,girl3];
              [student setValue:array forKey:@"mettingList"];
              NSLog(@"%@",[student valueForKeyPath:@"mettingList.age"]);
              NSLog(@"%@",[student valueForKeyPath:@"mettingList.@count"]);
              NSLog(@"%@",[student valueForKeyPath:@"mettingList.@avg.age"]);
              
              
              //KVO
              [student addObserver:girl1 forKeyPath:@"name1" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:NULL];
              
              student.name1 = @"徐海乔";
              [student removeObserver:girl1 forKeyPath:@"name1"];
              
              
              
              
              
              
       }
    return 0;
}
