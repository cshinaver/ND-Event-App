//
//  EventsViewController.h
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "Location.h"

@interface EventsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property Event *event;
@property User *currentUser;

@property (weak, nonatomic) IBOutlet UILabel *host;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UILabel *start;
@property (weak, nonatomic) IBOutlet UILabel *end;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;
@property (weak, nonatomic) IBOutlet UILabel *nCheckedInLabel;
- (IBAction)checkedInButton:(id)sender;

@end
