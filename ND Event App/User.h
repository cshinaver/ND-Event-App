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
@property (retain) NSMutableArray *events;
@property (retain) NSMutableArray *friends;
@property NSString *phoneNumber;


+ (void)login:(NSString *)username password:(NSString *)password;
+ (User *)currentUser;
- (void)signUp;
- (void)saveToDatabase;
+ (User *)getUser:(NSString *)username;
+ (NSArray *)getAllUsers;
- (BOOL)isFriendsWith:(User *)myFriend;
- (NSArray *)getInvitedEvents;
- (NSArray *)getInvitedEventsFromFriend:(User *)f;

@end
