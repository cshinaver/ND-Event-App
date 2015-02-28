//
//  Event.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import<Foundation/Foundation.h>
#import "User.h"
@interface Event : NSObject

@property NSString *eventTitle;
@property User *host;
@property NSString *eventDescription;
@property NSString *location;
@property NSDate *start;
@property NSDate *end;

- (id)initWithEventTitle:(NSString *)eventTitle andDescription:(NSString *)eventDescription andLocation:(NSString *)location andStartTime:(NSDate *)start andEndTime:(NSDate *)end;

@end

