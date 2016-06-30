//
//  main.m
//  0411课堂练习
//
//  Created by AppleUser on 16/4/11.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   NSDate * now = [NSDate date];
    
    NSTimeInterval secondsWeek= 7 * 24* 60* 60;
    
    NSDate *lastWeek = [NSDate dateWithTimeInterval:-secondsWeek sinceDate:now];
    
    NSDate *nextWeek = [NSDate dateWithTimeInterval:secondsWeek sinceDate:now];
    NSLog(@"last week %@",lastWeek);
    NSLog(@"now %@",now);
     NSLog(@"next week %@",nextWeek);
    
    NSComparisonResult result = [now compare:lastWeek];
    if (result==NSOrderedAscending) {
        NSLog(@"now>lastweek");
    }else if (result==NSOrderedSame) {
        NSLog(@"now==lastweek");
    }else  {
        NSLog(@"now<lastweek");
    }
    
    NSDate *earlierDate = [now earlierDate:lastWeek];
    NSDate *lasterDtae = [now laterDate:lastWeek];
    
    NSLog(@"%@ is earlier than %@",earlierDate,lasterDtae);
    
    NSLog(@"%ld",(long)[lasterDtae compare:earlierDate]);
    
    NSCalendar *gregorian =[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSCalendar * buddist = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierBuddhist];
    NSCalendar *preferred =[NSCalendar currentCalendar];
    
    NSLog(@"%@",gregorian.calendarIdentifier);
    NSLog(@"%@",buddist.calendarIdentifier);
    NSLog(@"%@",preferred.calendarIdentifier);
    
    
    NSTimeZone *beijing=[NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDateFormatter *formatter1=[[NSDateFormatter alloc]init];
    NSLocale *posix=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [formatter1 setLocale:posix];
    
    
    
    
    
    
    return 0;
}
