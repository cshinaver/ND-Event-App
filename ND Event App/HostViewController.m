//
//  HostViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "HostViewController.h"
#import "Event.h"
#import "User.h"

@interface HostViewController ()

@end

@implementation HostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentUser = [User getUser:@"Mary"];
    [self.currentUser login:@"Mary" password: @"hi"];
    
    self.alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                message:@"Your event has been created!"
                                         preferredStyle:UIAlertControllerStyleAlert];
    self.successAlert = [UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action) {}];
    
    [self.alert addAction:self.successAlert];

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
    
    NSString *eventTitle;
    NSString *eventDescription;
    PFGeoPoint *location;
    NSDate *start;
    NSDate *end;
    User *host;
    NSArray *invitees;
    int viewStatus;
    
    if (self.theSwitch.isOn)
    {
        viewStatus = PRIVATE;
    }
    
    else
    {
        viewStatus = PUBLIC;
    }
    
    eventTitle = self.eventTitleInput.text;
    
    eventDescription = self.descriptionTextView.text;

    host = self.currentUser;
    
    NSCalendar *calendar1 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendar *calendar2 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components1 = [[NSDateComponents alloc] init];
    NSDateComponents *components2 = [[NSDateComponents alloc] init];
    
    [components1 setYear: [self.startYearInput.text intValue]];
    [components1 setMonth: [self.startMonthInput.text intValue]];
    [components1 setDay: [self.startDayInput.text intValue]];
    [components1 setHour: [self.startHourInput.text intValue]];
    [components1 setMinute: [self.startMinuteInput.text intValue]];
    
    start = [calendar1 dateFromComponents:components1];
    
    [components2 setYear: [self.endYearInput.text intValue]];
    [components2 setMonth: [self.endMonthInput.text intValue]];
    [components2 setDay: [self.endDayInput.text intValue]];
    [components2 setHour: [self.endHourInput.text intValue]];
    [components2 setMinute:[self.endMinuteInput.text intValue]];
    
    end = [calendar2 dateFromComponents:components2];
    
    NSMutableCharacterSet *workingSet = [[NSMutableCharacterSet alloc] init];
    [workingSet addCharactersInString:@" ,\n"];
    NSCharacterSet *finalCharacterSet = [workingSet copy];
    invitees = [self.friendsTextView.text componentsSeparatedByCharactersInSet: finalCharacterSet];
    
    Event *e = [[Event alloc] initWithEventTitle:eventTitle andDescription:eventDescription andLocation:[[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:start andEndTime:end andHost:host andInvitees:invitees andViewStatus:viewStatus];
    
    // Add event to user's events
    [self.currentUser.events addObject:e];
    // Save user
    [self.currentUser saveToDatabase];
    
    // Save event
    [e saveToDatabase];
    
    [self presentViewController:self.alert animated:YES completion:nil];
    
}
@end
