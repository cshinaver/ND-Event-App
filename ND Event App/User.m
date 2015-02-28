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
#import <Parse/Parse.h>

@implementation User

@dynamic fullName;
@dynamic friends;
@dynamic events;

+ (void)load {
	[self registerSubclass];
}

+ (User *)currentUser {
    return (User *)[PFUser currentUser];
}

- (void)signUp
{
    [self signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
        }
    }];
    
}

+ (User *)getUser:(NSString *)username
{
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:username];
    NSArray *users = [query findObjects];
    
    return users[0];

    
}

@end

