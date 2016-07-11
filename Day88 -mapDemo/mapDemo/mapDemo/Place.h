//
//  Place.h
//  mapDemo
//
//  Created by 李康 on 16/6/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface Place : NSObject<MKAnnotation>


@property(copy,nonatomic) NSString *title;

@property(copy,nonatomic) NSString *subtitle;

@property(assign,nonatomic) CLLocationCoordinate2D  coordinate;



@end
