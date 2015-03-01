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

@property (strong, retain) Event *e;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *friendsTextView;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (weak, nonatomic) IBOutlet UITextField *eventTitleInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (weak, nonatomic) IBOutlet UITextField *startMonthInput;
@property (weak, nonatomic) IBOutlet UITextField *startDayInput;
@property (weak, nonatomic) IBOutlet UITextField *startYearInput;
@property (weak, nonatomic) IBOutlet UITextField *startHourInput;
@property (weak, nonatomic) IBOutlet UITextField *startMinuteInput;
@property (weak, nonatomic) IBOutlet UITextField *endMonthInput;
@property (weak, nonatomic) IBOutlet UITextField *endDayInput;
@property (weak, nonatomic) IBOutlet UITextField *endYearInput;
@property (weak, nonatomic) IBOutlet UITextField *endHourInput;
@property (weak, nonatomic) IBOutlet UITextField *endMinuteInput;

@property NSMutableArray *invitees;
@property CLLocation *location;





- (IBAction)createEvent:(id)sender;


@end
