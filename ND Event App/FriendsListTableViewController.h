//
//  FriendsListTableViewController.h
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface FriendsListTableViewController : UITableViewController

@property User *currentUser;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
