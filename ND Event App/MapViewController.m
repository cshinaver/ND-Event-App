//
//  MapViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "User.h"
#import "Event.h"

@interface MapViewController () {
    CLLocationManager *lm;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Get location permission
    lm = [CLLocationManager new];
    [lm requestWhenInUseAuthorization];
    
    // Set delegate
    self.mapView.delegate = self;
    
    
    self.currentUser = [User currentUser];
}

- (void)viewDidAppear:(BOOL)animated
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(41.700278, -86.230733), 3200, 3200);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    NSArray *events = [self.currentUser getInvitedEvents];
    
    // Create points for each event
    for (Event *e in events)
    {
        [self createAnnotationWithCoordinate:[[[CLLocation alloc] initWithLatitude:e.location.latitude longitude:e.location.longitude] coordinate] andTitle:e.eventTitle andSubtitle:e.host.username];
    }
}

-(void)createAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubtitle:(NSString *)subtitle
{
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = title;
    point.subtitle = subtitle;
    
    [self.mapView addAnnotation:point];
                                
                                
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
