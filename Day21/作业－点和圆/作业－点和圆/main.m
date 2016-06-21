//
//  main.m
//  作业－点和圆
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"
#import "Circle.h"
int main(int argc, const char * argv[]) {
    Point2D *p1 = [Point2D new];
    Point2D *p2 = [[Point2D alloc]init];

    [p1 setX:3 andWithY:4];
    [p2 setX:2 andWithY:0];
    
    double d1 = [p1 distanceWithOther:p2];
    double d2 = [Point2D distanceBetweenPoint1:p1 andWithPoint2:p2];
    NSLog(@"d1 = %f,d2=%f",d1,d2);
    
    Circle *c1 = [Circle new];
    Circle *c2 = [Circle new];
    
    c1.point = p1;
    c2.point = p2;
    
    c1.radius = 1;
    c2.radius =1;
    
    if ([c1 isIntersectWithOther:c2]) {
        NSLog(@"c1和c2相交");
    }
    
    if ([Circle isIntersectBetweenCircle:c1 andCircle2:c2]) {
        NSLog(@"c1和c2相交");
    }
    return 0;
}
