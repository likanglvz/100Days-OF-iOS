//
//  main.m
//  常用结构体的使用
//
//  Created by 李康 on 16/4/1.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /*NSRange*/
    NSRange r1 = {4,5};
    NSRange r2 = NSMakeRange(4, 5);
    NSString *s1 = NSStringFromRange(r1);
    NSLog(@"%@",s1);
    
    
    /*NSSize*/
    NSSize size1 = NSMakeSize(40, 50);
    NSSize size2 = {40,50};
    NSString *s2 = NSStringFromSize(size1);
    NSLog(@"%@",s2);
    
    /*NSPoint*/
    NSPoint point1 = {20,40};
    point1 = NSMakePoint(20, 40);
    s2 = NSStringFromPoint(point1);
    
    /*NSRect*/
    NSRect rect1 = NSMakeRect(40, 40, 30, 50);
    
    /*NSValue的使用,用于把C的数据转为对象类型*/
    NSValue *v1 = [NSValue valueWithPoint:point1];
    NSValue *v2 = [NSValue valueWithRect:rect1];
    NSLog(@"v1=%@",v1);
    
    NSPoint p;
    [v1 getValue:&p];
    
    p = v1.pointValue;
    
    NSLog(@"p=%@",NSStringFromPoint(p));
    return 0;
}
