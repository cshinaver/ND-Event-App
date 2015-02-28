//
//  EventsViewController.m
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.eventDescription.numberOfLines = 0;
    [self.eventDescription sizeToFit];

    self.eventTitle.text = self.event.eventTitle;
    
    self.host.text = [NSString stringWithFormat:@"Hosted by: %@", self.event.host.fullName];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"M/d/y h:mm a"];
    
    NSString *prettydate = [formatter stringFromDate:self.event.start];
    
    self.start.text = [NSString stringWithFormat:@"Start: %@", prettydate];
    
    prettydate = [formatter stringFromDate:self.event.end];
    
    self.end.text = [NSString stringWithFormat:@"End: %@", prettydate];
    
    self.location.text = [NSString stringWithFormat:@"Location: %@", self.event.location];
    
    self.eventDescription.text = [NSString stringWithFormat:@"Description: %@", self.event.eventDescription];
    
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

@end
