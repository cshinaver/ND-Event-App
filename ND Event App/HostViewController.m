//
//  HostViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "HostViewController.h"
#import "Event.h"

@interface HostViewController ()

@end

@implementation HostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = @"Host your own event";
    self.switchLabel.text = @"Private event";
    [self.theSwitch setOn:NO];
    self.eventTitleLabel.text = @"Event title";
    self.eventDescriptionLabel.text = @"Description";
    self.locationLabel.text = @"Location";
    self.startDateLabel.text = @"Start date";
    self.endDateLabel.text = @"End date";
    self.startTimeLabel.text = @"Time";
    self.endTimeLabel.text = @"Time";
    self.friendsLabel.text = @"Friends";
    self.descriptionTextView.layer.borderWidth = 1.0;
    self.descriptionTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.friendsTextView.layer.borderWidth = 1.0;
    self.friendsTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.createButton setTitle:@"Create event" forState:UIControlStateNormal];
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

- (IBAction)createEvent:(id)sender {
    
    Event *e = [[Event alloc] init];
    
    if (self.theSwitch.isOn)
    {
        e.viewStatus = PRIVATE;
    }
    
    else
    {
        e.viewStatus = PUBLIC;
    }
    
    e.eventTitle = self.eventTitleInput.text;
    e.location = self.locationInput.text;
    
    
    
    
}
@end
