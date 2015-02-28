//
//  FriendsListTableViewController.m
//  ND Event App
//
//  Created by Charles Shinaver on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "FriendsListTableViewController.h"
#import "User.h"
#import "Event.h"
#import "FriendsEventsTableViewController.h"
#import <Parse/Parse.h>
#import <Parse/PFSubclassing.h>

#import <Parse/PFObject.h>

@interface FriendsListTableViewController ()

@end

@implementation FriendsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
//	self.currentUser = [[User alloc] init];
//
	User *currentUser=[User object];
	User *friend1=[User object];
	User *friend2=[User object];
	//User *friend3=[User object];
	
	currentUser.fullName = @"Anna";
	friend1.fullName = @"Charles";
	friend2.fullName = @"Mary";
	currentUser.username = @"amcaewrz1";
	currentUser.password = @"goirish";
	friend1.username = @"amcar1z";
	friend1.password = @"goirish";
	friend2.username = @"amcas7z1";
	friend2.password = @"goirish";
//	
//	PFRelation *relation = [currentUser relationForKey:@"friend"];
//	[relation addObject:[PFUser currentUser]];
//	[relation addObject:[PFUser currentUser]];
	[friend1 signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (!error) {
			// Hooray! Let them use the app now.
		} else {
			//NSString *errorString = [error userInfo][@"error"];
			// Show the errorString somewhere and let the user try again.
		}
	}];
	
	[currentUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (!error) {
			// Hooray! Let them use the app now.
		} else {
			//NSString *errorString = [error userInfo][@"error"];
			// Show the errorString somewhere and let the user try again.
		}
	}];
	[friend2 signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (!error) {
			// Hooray! Let them use the app now.
		} else {
			//NSString *errorString = [error userInfo][@"error"];
			// Show the errorString somewhere and let the user try again.
		}
	}];
	
	PFRelation *relation = [[PFUser currentUser] objectForKey:@"Friendship"];
	[relation addObject:friend1];
	
	

	
//	currentUser = [User objectWithClassName:@"User"];
//	[currentUser setObject:[User currentUser ] forKey:@"friends"];

	Event *e1 = [[Event alloc] initWithEventTitle:@"Kitteh Day" andDescription:@"All the kittehs" andLocation:[[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:[NSDate date] andEndTime:[NSDate date]];
	e1[@"parent"]= currentUser;
	[e1 saveInBackground];
	[currentUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (!error) {
			// Hooray! Let them use the app now.
		} else {
			//NSString *errorString = [error userInfo][@"error"];
			// Show the errorString somewhere and let the user try again.
		}
	}];
	
	
	//PFObject *User= [PFObject objectWithClassName:@"User"];
	//User[@"fullName"] = @"Anna";
//	//User[@"events"] = @[@"event1", @"event2"];
//	//User2[@"friends"] = @[@"name1", @"name2"];

//	PFQuery *query = [PFQuery queryWithClassName:@"User"];
//	[query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *User, NSError *error) {
//		// Do something with the returned PFObject in the gameScore variable.
//		NSLog(@"%@", User);
//	}];
//	
	

//    self.currentUser = [[User alloc] init];
//    User *user1 = [[User alloc] init];
//
//    user1.username = @"user1";
//    user1.fullName = @"Joe Moran";
//    self.currentUser.friends = [[NSArray alloc] initWithObjects:user1, nil];
//    Event *event1 = [[Event alloc] init];
//    event1.eventTitle = @"Party in Dillon";
//    event1.eventDescription = @"A fun little get together in Dillon ;)";
//    event1.location = @"Dillon. duh";
//    NSCalendar *calendar = [[NSCalendar alloc] init];
//    NSDateComponents *components = [[NSDateComponents alloc] init];
//    [components setYear: 2015];
//    [components setMonth: 5];
//    [components setDay: 22];
//    [components setHour:20];
//    [components setMinute:0];
//    event1.start = [calendar dateFromComponents:components];
//    [components setHour:23];
//    [components setMinute:0];
//    event1.end = [calendar dateFromComponents:components];
//    user1.events = [NSArray arrayWithObjects: event1, nil];
//    self.currentUser.friends = [NSArray arrayWithObjects: user1, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    return self.currentUser.friends.count;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    User *u = self.currentUser.friends[indexPath.row];
//    
//    cell.textLabel.text = u.username;
//    
//    return cell;
//}
//

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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FriendsEventsTableViewController *fe = [segue destinationViewController];
    User *u = self.currentUser.friends[self.tableView.indexPathForSelectedRow.row];
    fe.events = u.events;
 
}






@end
