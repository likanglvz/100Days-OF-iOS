//
//  main.m
//  0411exercise
//
//  Created by AppleUser on 16/4/11.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>
//2014/2月最后一天是几号
int main1(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDateFormatter *f=[[NSDateFormatter alloc]init];
        NSLocale *lo=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSTimeZone *beijing=[NSTimeZone timeZoneWithName:@"Asia/Shanghai"];

        [f setLocale:lo];
        [f setTimeZone:beijing];
        [f setDateFormat:@"yyyy-MM-dd"];
        
        NSDate *date=[f dateFromString:@"2014-2-1"];
        NSCalendar *cal=[NSCalendar currentCalendar];
        NSRange r=[cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        NSLog(@"%ld",r.length);
        
    }
    return 0;
}



//今天是星期几？
int main2(int argc, const char * argv[]){
    NSDateComponents *com;
    [com setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSCalendar *cal=[NSCalendar currentCalendar];
    com = [cal components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    
    NSInteger val = [com weekday];
    NSLog(@"%ld",(long)val);
    
   
    
    return 0;
}
//今天是本年的第几周？
int main(int argc, const char * argv[]){
     NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger val=[cal ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:[NSDate date]];
     NSLog(@"%ld",(long)val);







    return  0 ;
}





















