//
//  loginViewController.h
//  ND Event App
//
//  Created by Anna Jo McMahon on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(id)sender;

@end
