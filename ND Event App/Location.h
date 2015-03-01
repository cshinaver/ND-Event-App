//
//  Location.h
//  ND Event App
//
//  Created by Charles Shinaver on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <Parse/Parse.h>
#import <Parse/PFSubclassing.h>
#import <Parse/PFObject.h>

@interface Location : PFObject <PFSubclassing>

@property NSString *LocationName;
@property NSString *longitude;
@property NSString *Latitute;

@end
