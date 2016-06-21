//
//  Point2D.m
//  作业－点和圆
//
//  Created by 李康 on 16/3/22.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Point2D.h"

@implementation Point2D
-(void)setX:(double)x
{
    _x = x;
}
-(double)x
{
    return _x;
}
-(void)setY:(double)y
{
    _y = y;
}
-(double)y
{
    return _y;
}

/*同时设置x和y*/
-(void)setX:(double)x andWithY:(double)y
{
        //第一种写法
//    _x = x;
//    _y = y;
//第二种写法
//    [self setX:x];
//    [self setY:y];
//第三种写法
    self.x = x;
    self.y = y;
    
}
/*计算两个点距离*/
+(double)distanceBetweenPoint1:(Point2D*)p1 andWithPoint2:(Point2D*)p2
{
    double x0 = p1.x-p2.x;
    double y0 = p1.y-p2.y;
    return sqrt(pow(x0, 2)+pow(y0, 2));
}
-(double)distanceWithOther:(Point2D*)other
{
    return [Point2D distanceBetweenPoint1:self andWithPoint2:other];
}
@end
