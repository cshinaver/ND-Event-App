//
//  Location.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "Location.h"

@implementation Location
@dynamic Latitute, longitude, LocationName;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Event";
}
@end
