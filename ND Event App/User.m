//
//  User.m
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "User.h"
#import <Parse/PFObject+Subclass.h>
#import <Parse/PFUser.h>

@implementation User

+ (void)load {
	[self registerSubclass];
}

@dynamic fullName;
@dynamic friends;
@dynamic events;
@dynamic username;

@end

