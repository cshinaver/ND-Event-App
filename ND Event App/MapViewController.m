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
    NSMutableArray *events;
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
    
    self.currentUser = [[User alloc] init];
    User *user1 = [[User alloc] init];
    user1.username = @"user1";
    user1.fullName = @"Joe Moran";
    self.currentUser.friends = [[NSArray alloc] initWithObjects:user1, nil];
    Event *event1 = [[Event alloc] init];
    event1.eventTitle = @"Party in Dillon";
    event1.eventDescription = @"A fun little get together in Dillon ;)";
    event1.location = @"Dillon. duh";
    NSCalendar *calendar = [[NSCalendar alloc] init];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear: 2015];
    [components setMonth: 5];
    [components setDay: 22];
    [components setHour:20];
    [components setMinute:0];
    event1.start = [calendar dateFromComponents:components];
    [components setHour:23];
    [components setMinute:0];
    event1.end = [calendar dateFromComponents:components];
    user1.events = [NSArray arrayWithObjects: event1, nil];
    self.currentUser.friends = [NSArray arrayWithObjects: user1, nil];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(41.700278, -86.230733), 3200, 3200);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    
    
    // Iterate through friends and events
    for (User *friend in self.currentUser.friends)
    {
        for (Event *e in friend.events)
        {
            if ([e.invitees containsObject:self.currentUser.fullName])
            {
                [events addObject:e];
            }
        }
        
    }
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
