//
//  Event.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "Event.h"
#import <Parse/PFObject+Subclass.h>

@implementation Event
@dynamic  eventTitle;
@dynamic  eventDescription;
@dynamic location;
@dynamic start;
@dynamic  end;
@dynamic host, invitees;
@dynamic viewStatus;

+ (void)load {
	[self registerSubclass];
}

+ (NSString *)parseClassName {
	return @"Event";
}

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(CLLocation *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end andHost:(User *)host andInvitees:(NSArray *)invitees andViewStatus:(int)viewStatus
{
    self = [super init];
    if(self) {
        self.eventTitle = eventTitle;
        self.eventDescription = eventDescription;
        self.location = [PFGeoPoint geoPointWithLocation:location];
        self.start = start;
        self.end = end;
        self.host = host;
        self.invitees = invitees;
        self.viewStatus = viewStatus;
    }
    return self;
}

@end
