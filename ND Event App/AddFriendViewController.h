//
//  AddFriendViewController.h
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AddFriendViewController : UIViewController

@property User *currentUser;
@property (weak, nonatomic) IBOutlet UILabel *addFriendLabel;
@property (weak, nonatomic) IBOutlet UITextField *addFriendTextField;
@property (weak, nonatomic) IBOutlet UIButton *addFriendButton;
- (IBAction)addFriend:(id)sender;

@end
