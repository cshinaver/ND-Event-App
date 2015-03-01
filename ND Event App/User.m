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
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no!" message:errorString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"another option", nil];
			
			[alert show];
        }
    }];
    
}


//	if([User getUser:self.usernameTextView.text] == nil){
//		NSLog(@"need to sign up");
//		//send alert to sign in or to dismiss
//	}
//	else{
//		User *currentUser = [User getUser:self.usernameTextView.text];
//		
//		if(currentUser.password != self.passwordTextView.text){
//			NSLog(@"WRONG");
//			// send alert wrong password
//		}
//		else{
//			NSLog(@"Login accepted");
//			
//		}
//	}

	
	


+ (User *)getUser:(NSString *)username
{
    PFQuery *query = [User query];
    [query whereKey:@"username" equalTo:username];
    NSArray *users = [query findObjects];
    if(users.count ==0 )
		return nil;
	else
		return users[0];

    
}

+ (NSArray *)getAllUsers
{
    PFQuery *query = [User query];
    NSArray *users = [query findObjects];
    
    return users;
    
}

@end

