//
//  GirlFriend.m
//  0505第二个KVC
//
//  Created by AppleUser on 16/5/5.
//  Copyright © 2016年 heyanan. All rights reserved.
//

#import "GirlFriend.h"

@interface GirlFriend ()
@property NSString * girlFriendName;
@property int age;
@end

@implementation GirlFriend
//属性改变后的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
       //取得改变后的新值
       NSString * newValue = change[NSKeyValueChangeNewKey];
       NSString * oldValue = change[NSKeyValueChangeOldKey];
       NSLog(@"value changed for %@ object,keypath:%@,old value %@,new value %@",[object className],keyPath,oldValue,newValue);
}




@end
