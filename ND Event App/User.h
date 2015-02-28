//
//  User.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFSubclassing.h>
#import <Parse/PFObject.h>
#import <Parse/PFUser.h>

@interface User : PFUser<PFSubclassing>

@property (retain) NSString *fullName;
@property (retain) NSArray *events;
@property (retain) NSArray *friends;


@end

// Armor.m
