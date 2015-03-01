//
//  EventsViewController.m
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "EventsViewController.h"
#import <Parse/PFQuery.h>

@interface EventsViewController ()

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentUser = [User currentUser];
    
    self.eventDescription.numberOfLines = 0;
    [self.eventDescription sizeToFit];
    
    [self.event.host fetch];

    self.eventTitle.text = self.event.eventTitle;
    
    self.host.text = [NSString stringWithFormat:@"Hosted by: %@", self.event.host.username];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"M/d/y h:mm a"];
    
    NSString *prettydate = [formatter stringFromDate:self.event.start];
    
    self.start.text = [NSString stringWithFormat:@"Start: %@", prettydate];
    
    prettydate = [formatter stringFromDate:self.event.end];
    
    self.end.text = [NSString stringWithFormat:@"End: %@", prettydate];
    
    // Get location from database
    NSArray *arr;
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    [query whereKey:@"locationPoint" equalTo:self.event.location];
    
    arr = [query findObjects];
    
    self.location.text = [NSString stringWithFormat:@"Location: %@", arr[0][@"LocationName"]];
    
    self.eventDescription.text = [NSString stringWithFormat:@"Description: %@", self.event.eventDescription];
    if ([self.event userIsCheckedIn:self.currentUser])
    {
        [self.theSwitch setOn:YES];
    }
    else
    {
        [self.theSwitch setOn:NO];
    }
    
    self.nCheckedInLabel.text = [NSString stringWithFormat:@"Number of users checked in: %lu", (unsigned long)self.event.checkedIn.count];
    
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

- (IBAction)checkedInButton:(id)sender {
    
    if (self.theSwitch.isOn)
    {
        [self.theSwitch setOn:YES];
        
        if(![self.event userIsCheckedIn:self.currentUser])
        {
            [self.event.checkedIn addObject:self.currentUser];
        }
    }
    
    else if (!(self.theSwitch.isOn))
    {
        [self.theSwitch setOn:NO];
        
        if ([self.event userIsCheckedIn:self.currentUser])
        {
            [self.event.checkedIn removeObject:self.currentUser];
        }
    }
    
    [self.event saveToDatabase];
    
    self.nCheckedInLabel.text = [NSString stringWithFormat:@"Number of users checked in: %lu", (unsigned long)self.event.checkedIn.count];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    self.currentUser = [User currentUser];
    
    self.nCheckedInLabel.text = [NSString stringWithFormat:@"Number of users checked in: %lu", (unsigned long)self.event.checkedIn.count];
}

@end
