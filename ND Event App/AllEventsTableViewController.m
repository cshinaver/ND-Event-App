//
//  AllEventsTableViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "AllEventsTableViewController.h"
#import "Event.h"
#import "EventsViewController.h"
#import <MapKit/MapKit.h>

@interface AllEventsTableViewController ()

@end

@implementation AllEventsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Dummy events
    Event *e1 = [[Event alloc] initWithEventTitle:@"Kitteh Day" andDescription:@"All the kittehs" andLocation: [[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:[NSDate date] andEndTime:[NSDate date]];
    Event *e2 = [[Event alloc] initWithEventTitle:@"Kitteh Day" andDescription:@"All the kittehs" andLocation:[[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:[NSDate date] andEndTime:[NSDate date]];
    Event *e3 = [[Event alloc] initWithEventTitle:@"Kitteh Day" andDescription:@"All the kittehs" andLocation:[[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:[NSDate date] andEndTime:[NSDate date]];
    
    self.publicEvents = [[NSArray alloc] initWithObjects:e1, e2, e3, nil];
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
    return self.publicEvents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Event *e = self.publicEvents[indexPath.row];
    cell.textLabel.text = e.eventTitle;
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EventsViewController *evc = [segue destinationViewController];
    
    Event *e = self.publicEvents[self.tableView.indexPathForSelectedRow.row];
    evc.event = e;
}

@end
