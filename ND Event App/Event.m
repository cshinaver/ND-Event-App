//
//  Event.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "Event.h"

@implementation Event

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(CLLocation *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end
{
    self = [super init];
    if(self) {
        self.eventTitle = eventTitle;
        self.eventDescription = eventDescription;
        self.location = location;
        self.start = start;
        self.end = end;
    }
    return self;
}

@end
