//
//  signUpViewController.m
//  ND Event App
//
//  Created by Anna Jo McMahon on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "signUpViewController.h"
#import "User.h"
@implementation signUpViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)actionRegisterUITextFields:(UITextField *)sender {
}

- (IBAction)createNewAccountButton:(UIButton *)sender {
	
	NSLog(@"create account button pushed");
	
	User *user = (User *)[User object];
	user.username = self.usernameTextView.text;
	user.password = self.passwordTextView.text;
	
	[user signUp];
	// check if username is already in data base
	// send validation email
	// see if the email is already taken
}

- (void)viewDidLoad {
	[super viewDidLoad];

	
}

@end
