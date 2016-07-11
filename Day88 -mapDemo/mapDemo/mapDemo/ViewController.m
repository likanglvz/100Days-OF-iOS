//
//  ViewController.m
//  mapDemo
//
//  Created by 李康 on 16/6/3.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Place.h"



@interface ViewController ()<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtLng;
@property (weak, nonatomic) IBOutlet UITextField *txtlas;
@property (weak, nonatomic) IBOutlet UITextField *txtAlt;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong,nonatomic) CLLocation *currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *txtview;






@end

@implementation ViewController





-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.locationManager startUpdatingLocation];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建位置管理器
    self.locationManager = [[CLLocationManager alloc]init];
    
    self.locationManager.delegate = self;
    //所需精度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //水平移动多少距离产生更新事件
    self.locationManager.distanceFilter = 1000.0f;
    
    //授权定位
    [self.locationManager requestWhenInUseAuthorization];
    //开始更新位置
    [self.locationManager requestAlwaysAuthorization];
    
    self.mapView.showsUserLocation = YES;
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self.locationManager stopUpdatingLocation];
 
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate

//位置改变时，触发
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    self.currentLocation = [locations lastObject];
    
    self.txtLng.text = [NSString stringWithFormat:@"%3.5f",self.currentLocation.coordinate.longitude];
    
    self.txtlas.text = [NSString stringWithFormat:@"%3.5f",self.currentLocation.coordinate.latitude];
    
    self.txtAlt.text = [NSString stringWithFormat:@"%3.5f",self.currentLocation.altitude];
    
   
    //地图标注
    
    Place *start = [[Place alloc]init];
    
    start.coordinate = self.currentLocation.coordinate;
    
    start.title = @"您的位置";
    
    start.subtitle = @"南京通济门附近";
    
    [self.mapView addAnnotation:start];
    
    //区域
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.currentLocation.coordinate, 500, 500);
    
    [self.mapView setRegion:region animated:YES];
    
    
    
    
    
    
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"error %@",error);
    
    
    
}



- (IBAction)query:(id)sender {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ([placemarks count]>0) {
            
            CLPlacemark *placemark = placemarks[0];
            
            NSDictionary *addressDictionary = placemark.addressDictionary;
            
            NSString * street = addressDictionary[@"Street"];
            
            NSString *state = addressDictionary[@"State"];
            
            NSString *city = addressDictionary[@"City"];
            
            NSString *name = addressDictionary[@"Name"];
            
            self.txtview.text = [NSString stringWithFormat:@"%@%@%@%@",state,city,street,name];
        }
        
        
        
        
        
        
    }];
    
    
    
    
}























@end
