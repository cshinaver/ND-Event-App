//
//  loginViewController.h
//  ND Event App
//
//  Created by Anna Jo McMahon on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameTextView;


@property (strong, nonatomic) IBOutlet UITextField *passwordTextView;

- (IBAction)findEventsButton:(UIButton *)sender;


@end
