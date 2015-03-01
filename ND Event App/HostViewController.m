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
#import "DatePickerViewController.h"
#import <Parse/PFQuery.h>

@interface HostViewController ()

@end

@implementation HostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentUser = [User getUser:@"Mary"];
    [User login:@"Mary" password: @"hi"];
    
    self.alert = [UIAlertController alertControllerWithTitle:@"Hooray!"
                                                message:@"Your event has been created!"
                                         preferredStyle:UIAlertControllerStyleAlert];
    self.successAlert = [UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action) {}];
    
    [self.alert addAction:self.successAlert];

    self.switchLabel.text = @"Private event";
    [self.theSwitch setOn:NO];
    self.eventTitleLabel.text = @"Event title";
    self.eventDescriptionLabel.text = @"Description";
    self.locationLabel.text = @"Location";
    self.startDateLabel.text = @"When";
    self.friendsLabel.text = @"Friends";
    self.descriptionTextView.layer.borderWidth = 1.0;
    self.descriptionTextView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.createButton setTitle:@"Create event" forState:UIControlStateNormal];
    
    // Memory to invitees
    self.invitees = [NSMutableArray new];
    self.e = [Event new];

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
    
    if (self.destination == 1)
    {
        MultipleSelectionTableViewController *mc = [segue destinationViewController];
        mc.hvc = self;
        PFQuery *query = [PFQuery queryWithClassName:@"Location"];
        mc.items = [query findObjects];
    }
    
    else if (self.destination == 2)
    {
        MultipleSelectionTableViewController *mc = [segue destinationViewController];
        mc.hvc = self;
        mc.items = [User getAllUsers];
    }
    
    else
    {
        DatePickerViewController *dp = [segue destinationViewController];
        dp.delegate = self;
    }
    
}

- (IBAction)locationButton:(id)sender {
    self.destination = 1;
}

- (IBAction)dateButton:(id)sender {
    self.destination = 3;
}

- (IBAction)inviteesButton:(id)sender {
    self.destination = 2;
}

- (IBAction)createEvent:(id)sender {
    
    NSString *eventTitle;
    NSString *eventDescription;
    User *host;
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
    
    self.e.eventTitle = eventTitle;
    self.e.eventDescription = eventDescription;
    self.e.location = self.location;
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

-(void)sendDataToA:(NSDate *)start andEnd:(NSDate *)end
{
    self.e.start = start;
    self.e.end = end;
    
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
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

@end
