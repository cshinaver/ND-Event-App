//
//  HostViewController.h
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Event.h"

@interface HostViewController : UIViewController <NSURLConnectionDelegate>

@property User *currentUser;

@property UIAlertController *alert;
@property UIAlertAction *successAlert;
@property int destination; //1 for location, 2 for invitees, 3 for date/time

@property (strong, retain) Event *e;

@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (weak, nonatomic) IBOutlet UITextField *eventTitleInput;


@property NSMutableArray *invitees;
@property PFGeoPoint *location;



- (IBAction)locationButton:(id)sender;
- (IBAction)dateButton:(id)sender;
- (IBAction)inviteesButton:(id)sender;


- (IBAction)createEvent:(id)sender;


@end
