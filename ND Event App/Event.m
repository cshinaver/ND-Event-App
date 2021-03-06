//
//  Event.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "Event.h"
#import <Parse/PFObject+Subclass.h>
#import <Parse/PFQuery.h>

@implementation Event
@dynamic  eventTitle;
@dynamic  eventDescription;
@dynamic location;
@dynamic start;
@dynamic  end;
@dynamic host, invitees;
@dynamic viewStatus;
@dynamic checkedIn;

+ (void)load {
	[self registerSubclass];
}

+ (NSString *)parseClassName {
	return @"Event";
}

-(void)saveToDatabase
{
    [self saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            
            NSLog(@"Added event");
        } else {
            // There was a problem, check error.description
            NSLog(@"Not so saved...");
        }
    }];
}
- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(PFGeoPoint *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end andHost:(User *)host andInvitees:(NSArray *)invitees andViewStatus:(int)viewStatus andCheckedIn:(NSMutableArray *)checkedIn
{
    self = [super init];
    if(self) {
        self.eventTitle = eventTitle;
        self.eventDescription = eventDescription;
        self.location = location;
        self.start = start;
        self.end = end;
        self.host = host;
        self.invitees = invitees;
        self.viewStatus = viewStatus;
        self.checkedIn = checkedIn;
    }
    return self;
}

+ (NSArray *)getAllPublicEvents
{
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query whereKey:@"viewStatus" equalTo:@0];
    //[query includeKey:@"Invitees"];
    NSArray *events =  [query findObjects];
    
    return events;
    
}

-(BOOL)userIsCheckedIn:(User *)u
{
    int i;
    for(i=0; i<self.checkedIn.count; i++)
    {
        if ([self.checkedIn[i] isEqual: u])
        {
            return 1;
        }
    }
    return 0;
}

@end
