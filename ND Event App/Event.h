//
//  Event.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import<Foundation/Foundation.h>

#import <Parse/PFSubclassing.h>
#import <Parse/PFObject.h>
@interface Event : PFObject<PFSubclassing>
+(NSString*)parseClassName;
@property NSString *eventTitle;
@property NSString *eventDescription;
@property NSString *location;
@property NSDate *start;
@property NSDate *end;

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(NSString *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end;

@end

