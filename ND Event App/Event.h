//
//  Event.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import<Foundation/Foundation.h>

#ifndef ND_Event_App_Event_h
#define ND_Event_App_Event_h

@interface Event : NSObject

@property NSString *eventTitle;
@property NSString *description;
@property NSString *location;
@property NSDate *start;
@property NSDate *end;

@end

#endif
