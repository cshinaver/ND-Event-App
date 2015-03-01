//
//  signUpViewController.h
//  ND Event App
//
//  Created by Anna Jo McMahon on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
- (IBAction)createAccount:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end
