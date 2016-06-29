//
//  Circle.m
//  作业－点和圆
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Circle.h"

@implementation Circle
-(void)setRadius:(double)radius
{
    _radius = radius;
}
-(double)radius
{
    return _radius;
}

-(void)setPoint:(Point2D*)point
{
    _point = point;
}
-(Point2D*)point
{
    return _point;
}
+(BOOL)isIntersectBetweenCircle:(Circle*)circle1 andCircle2:(Circle*)circle2
{
    Point2D *p1 = circle1.point;
    Point2D *p2 = circle2.point;
    double distance = [p1 distanceWithOther:p2];
//    distance = [Point2D distanceBetweenPoint1:p1 andWithPoint2:p2];
        //计算两个半径和
    double radiusSum = circle1.radius +circle2.radius;
    return distance<radiusSum;
}
    //跟其他圆是否相交
-(BOOL)isIntersectWithOther:(Circle*)other
{
    return [Circle isIntersectBetweenCircle:self andCircle2:other];
}

@end
