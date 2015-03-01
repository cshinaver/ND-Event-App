//
//  loginViewController.m
//  ND Event App
//
//  Created by Anna Jo McMahon on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "loginViewController.h"
#import "User.h"
@interface loginViewController ()<UIAlertViewDelegate>

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
	//[[self UITabBarNotification] setNavigationBarHidden:NO animated:YES];

	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)findEventsButton:(UIButton *)sender {
	
	NSLog(@"find events button pushed");
	
	User *user = (User *)[User object];
	user.username = self.usernameTextView.text;
	user.password = self.passwordTextView.text;
	
	[user logIn];
	
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString* buttonTitle= [alertView buttonTitleAtIndex:buttonIndex];
	
	if([buttonTitle isEqualToString:@"Create Account"]){
		[self performSegueWithIdentifier: @"segue.login" sender:self];
	}
}

- (IBAction)loginButton:(UIButton *)sender {
	
	
	[PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
				block:^(PFUser *user, NSError *error) {
			if (!error) {
			// Hooray! Let them use the app now.
				PFUser *currentUser = [PFUser currentUser];
				
				
			} else {
				NSString *errorString = [error userInfo][@"error"];
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User name does not exist!" message:errorString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Create Account",nil ];
				//REPLACE NIL W/ func call
											[alert show];
										}
				}];
	
	
	
	
	
	
	
	
	
	
}







@end
