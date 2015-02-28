//
//  User.h
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ND_Event_App_User_h
#define ND_Event_App_User_h

@interface User : NSObject

@property NSString *username;
@property NSString *fullName;
@property NSArray *events;
@property NSArray *friends;

@end

#endif