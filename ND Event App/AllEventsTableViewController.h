//
//  AllEventsTableViewController.h
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AllEventsTableViewController : UITableViewController

@property NSArray *publicEvents;
@property User *currentUser;
@end
