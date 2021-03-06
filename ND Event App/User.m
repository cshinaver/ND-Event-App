//
//  User.m
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "User.h"
#import "Event.h"
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

+ (void)login:(NSString *)username password:(NSString *)password
{
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"%@", [NSString stringWithFormat:@"Signed in with %@", username]);
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"%@", [NSString stringWithFormat:@"Couldn't sign in with %@", username]);
                                            
                                        }
                                    }];
}


- (NSArray *)getInvitedEvents
{
    /*
     Gets events user was invited to
    */
    NSMutableArray *events = [[NSMutableArray alloc] init];
    
    NSArray *arr;
    
    for (User *friend in self.friends)
    {
        PFQuery *query = [Event query];
        [query whereKey:@"host" equalTo:[User getUser:friend.username]];
        arr = [query findObjects];
        for (Event *e in arr)
        {
            if ([e.invitees containsObject:self.username])
            {
                [events addObject:e];
            }
        }
        
    }
    
    return [[NSArray alloc] initWithArray: events];
    
}

- (NSArray *)getInvitedEventsFromFriend:(User *)f
{
    NSMutableArray *events = [NSMutableArray new];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query whereKey:@"host" equalTo:[User getUser:f.username]];
    NSArray *arr = [query findObjects];
    for (Event *e in arr)
    {
        if ([e.invitees containsObject:self.username])
        {
            [events addObject:e];
        }
    }
    
    return events;
}

-(void) saveToDatabase
{
    [self saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            
            NSLog(@"Saved user with event");
        } else {
            // There was a problem, check error.description
            NSLog(@"Not so saved...");
        }
    }];
    
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
    PFQuery *query = [User query];
    [query whereKey:@"username" equalTo:username];
    [query includeKey:@"events"];
    [query includeKey:@"friends"];
    NSArray *users = [query findObjects];
    
    return users[0];

    
}

+ (NSArray *)getAllUsers
{
    PFQuery *query = [User query];
    NSArray *users = [query findObjects];
    [query includeKey:@"Events"];
    [query includeKey:@"Friends"];
    
    return users;
    
}

- (BOOL)isFriendsWith:(User *)myFriend
{
    User *friend;
    
    int i;
    
    for (i = 0; i<self.friends.count; i++)
    {
        friend = self.friends[i];
        
        if ([myFriend isEqual: friend])
        {
            return 1;
        }
    }
    
    return 0;
}

/*- (BOOL)isCheckedInto:(Event *)e
{
    int i;
    
    for (i=0; i<e.checkedIn.count; i++)
    {
        if ([self isEqual: e.checkedIn[i]])
        {
            return 1;
        }
    }
    
    return 0;
}*/

@end

