//
//  HostViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "HostViewController.h"
#import "User.h"
#import "MultipleSelectionTableViewController.h"
#import <Parse/PFQuery.h>

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
    
    // Memory to invitees
    self.invitees = [NSMutableArray new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    MultipleSelectionTableViewController *mc = [segue destinationViewController];
    mc.hvc = self;
    
    // Decide between locations or invitees
    if ([mc.title isEqualToString:@"Location"])
    {
        PFQuery *query = [PFQuery queryWithClassName:@"Location"];
        mc.items = [query findObjects];
    }
    else
    {
        mc.items = [User getAllUsers];
    }
    
}

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
    //invitees = [self.friendsTextView.text componentsSeparatedByCharactersInSet: finalCharacterSet];
    
    //self.e = [[Event alloc] initWithEventTitle:eventTitle andDescription:eventDescription andLocation:self.location andStartTime:start andEndTime:end andHost:host andInvitees:self.invitees andViewStatus:viewStatus];
    self.e = (Event *)[Event object];
    self.e.eventTitle = eventTitle;
    self.e.eventDescription = eventDescription;
    self.e.location = self.location;
    self.e.start = start;
    self.e.end = end;
    self.e.host = host;
    self.e.invitees = [NSMutableArray new];
    [self.e.invitees addObjectsFromArray:self.invitees];
    self.e.viewStatus = viewStatus;
    
    // Add event to user's events
    [self.currentUser.events addObject:self.e];
    // Save user
    [self.currentUser save];
    
    // Save event
    [self.e save];
    
    [self presentViewController:self.alert animated:YES completion:nil];
    
    // Clear stuff
    self.invitees = [NSMutableArray new];
    self.location = [PFGeoPoint new];
    [self POSTRequest];
    
}

- (void) POSTRequest {
    NSString *post = [NSString stringWithFormat:@"From=%@&To=%@Body=%@", @"+14439918722", self.currentUser.phoneNumber, @"Your event has been created"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://api.twilio.com/2010-04-10/Accounts/ACdf37f51e05545f38f847732fd43dda28/Messages"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
}

@end
