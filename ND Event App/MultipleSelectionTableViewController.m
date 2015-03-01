//
//  MultipleSelectionTableViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "MultipleSelectionTableViewController.h"
#import "User.h"
#import "Location.h"

@interface MultipleSelectionTableViewController ()

@end

@implementation MultipleSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...

    // Invitees
    if (tableView.allowsMultipleSelection == YES)
    {
        User *u = self.items[indexPath.row];
        cell.textLabel.text = u.username;
    }
    else
    {
        // Location
        Location *l = self.items[indexPath.row];
        cell.textLabel.text = l[@"LocationName"];
    }

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *tableCell = [tableView cellForRowAtIndexPath:indexPath];
    BOOL isSelected = (tableCell.accessoryType == UITableViewCellAccessoryCheckmark);
    
    if (isSelected) {
        tableCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    // Invitees
    if (tableView.allowsMultipleSelection == YES)
    {
        if (![self.hvc.invitees containsObject:self.items[indexPath.row]])
        {
            User *u = self.items[indexPath.row];
            [self.hvc.invitees addObject:u.username];
        }
    }
    else
    {
        // Location
        Location *l = self.items[indexPath.row];
        PFQuery *query = [PFQuery queryWithClassName:@"Location"];
        [query whereKey:@"LocationName" equalTo:l[@"LocationName"]];
        NSArray *arr = [query findObjects];
        self.hvc.location = arr[0][@"locationPoint"];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
