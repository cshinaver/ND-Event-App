//
//  User.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *username;
@property NSString *fullName;
@property NSArray *events;
@property NSArray *friends;

@end