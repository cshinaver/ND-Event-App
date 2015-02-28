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
	
    //User *user2 = (User *)[User object];
    //user2.username = @"Mary";
    //user2.password = @"banana";
    //user2.email = @"bshinaver@gmail.com";
    //[user2 signUp];
    //
    //User *user3 = (User *)[User object];
    //user3.username = @"Anna";
    //user3.password = @"banana";
    //user3.email = @"cshinaver@gmail.com";
    //[user3 signUp];
    
    User *user1 = (User *)[User object];
    user1.username = @"Charles";
    user1.password = @"banana";
    user1.email = @"gshinaver@gmail.com";
    
	PFQuery *query = [User query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                [user1.friends addObject:object];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    

    [user1 signUp];
    
  
	//PFObject *User= [PFObject objectWithClassName:@"User"];
	//User[@"fullName"] = @"Anna";
//	//User[@"events"] = @[@"event1", @"event2"];
//	//User2[@"friends"] = @[@"name1", @"name2"];

//	[query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *User, NSError *error) {
//		// Do something with the returned PFObject in the gameScore variable.
//		NSLog(@"%@", User);
//	}];
//	

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
