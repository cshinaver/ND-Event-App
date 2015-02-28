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

@interface Event : NSObject

enum {
    PRIVATE,
    PUBLIC
};

@property NSString *eventTitle;
@property User *host;
@property CLLocation *location;
@property NSString *eventDescription;
@property NSDate *start;
@property NSDate *end;
@property NSArray *invitees;
@property int viewStatus;

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(CLLocation *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end;

@end

