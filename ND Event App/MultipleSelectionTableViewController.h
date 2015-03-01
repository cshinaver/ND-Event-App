//
//  MultipleSelectionTableViewController.h
//  ND Event App
//
//  Created by Charles Shinaver on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostViewController.h"

@interface MultipleSelectionTableViewController : UITableViewController

@property HostViewController *hvc;
@property NSArray *items;

@end
