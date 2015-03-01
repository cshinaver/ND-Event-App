//
//  Event.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import<Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <Parse/PFSubclassing.h>
#import <Parse/PFObject.h>
#import <Parse/PFGeoPoint.h>
#import "User.h"

@interface Event : PFObject<PFSubclassing>

enum {
    PUBLIC,
    PRIVATE
};

+(NSString*)parseClassName;
@property NSString *eventTitle;
@property NSString *eventDescription;
@property PFGeoPoint *location;
@property NSDate *start;
@property NSDate *end;
@property User *host;
@property NSMutableArray *invitees;
@property int viewStatus;
@property NSMutableArray *checkedIn;

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(PFGeoPoint *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end andHost:(User *)host andInvitees:(NSArray *)invitees andViewStatus:(int)viewStatus andCheckedIn:(NSMutableArray *)checkedIn;

-(void)saveToDatabase;
+(NSArray *)getAllPublicEvents;
-(BOOL)userIsCheckedIn:(User *)u;

@end