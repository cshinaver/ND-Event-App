//
//  Event.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import<Foundation/Foundation.h>
#import "User.h"
#import <MapKit/MapKit.h>
#import <Parse/PFSubclassing.h>
#import <Parse/PFObject.h>
#import <Parse/PFGeoPoint.h>

@interface Event : PFObject<PFSubclassing>

enum {
    PRIVATE,
    PUBLIC
};

+(NSString*)parseClassName;
@property NSString *eventTitle;
@property NSString *eventDescription;
@property PFGeoPoint *location;
@property NSDate *start;
@property NSDate *end;
@property User *host;
@property NSArray *invitees;
@property int viewStatus;

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(CLLocation *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end andHost:(User *)host andInvitees:(NSArray *)invitees andViewStatus:(BOOL *)viewStatus;

@end

