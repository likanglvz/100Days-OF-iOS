//
//  GirlFriend.m
//  KVC
//
//  Created by 李康 on 16/5/5.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "GirlFriend.h"
@interface GirlFriend()

@property NSString *girlFriendName;
@property int age;

@end



@implementation GirlFriend
//属性改变后的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSString *newValue = change[NSKeyValueChangeNewKey];
    NSString *oldValue = change[NSKeyValueChangeOldKey];
    NSLog(@"value changed for :%@ object,kyepath:%@,old value :%@,new value:%@",[object className],keyPath,oldValue,newValue);
    
}




@end
