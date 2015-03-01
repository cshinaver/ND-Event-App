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
#import "AddFriendViewController.h"
#import <Parse/PFObject.h>

@interface FriendsListTableViewController ()< UIAlertViewDelegate>

@end

@implementation FriendsListTableViewController

#import "User.h"
- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD

    //User *user2 = (User *)[User object];
    //user2.username = @"Mary";
    //user2.password = @"banana";
    //user2.email = @"cshinaver@gmail.com";
    //[user2 signUp];
    //
    //User *user3 = (User *)[User object];
    //user3.username = @"Anna";
    //user3.password = @"banana";
    //user3.email = @"fshinaver@gmail.com";
    //[user3 signUp];
	
	

	// try to make a current user
//    User *user1 = (User *)[User object];
//    self.currentUser = user1;
//    self.currentUser.username = @"Charles";
//    self.currentUser.password = @"banana";
//    self.currentUser.email = @"gshinaver@gmail.com";
//	
//	[self logIn];
//
//	PFQuery *query = [User query];
//    self.currentUser.friends = [query findObjects];
//    PFQuery *query2 = [PFQuery queryWithClassName:@"Event"];
//    self.currentUser.events = [query findObjects];

  //  [self.currentUser signUp];
    
}





=======
    
    
    //Event *e1 = [[Event alloc] initWithEventTitle:@"Kitteh Day" andDescription:@"All the kittehs" andLocation: [[CLLocation alloc]initWithLatitude:41.700278 longitude:-86.230733] andStartTime:[NSDate date] andEndTime:[NSDate date] andHost:[User getUser:@"Charles"] andInvitees:[NSArray arrayWithObjects:[User getUser:@"Mary"], nil] andViewStatus:PRIVATE];
    //[e1 saveToDatabase];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.currentUser) {
        // do stuff with the user
        NSLog(@"%@ logged in", self.currentUser.username);

    } else {
        [User login:@"Charles" password:@"hi"];
        self.currentUser = [User getUser:@"Charles"];
    }
}
>>>>>>> master

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.currentUser.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    User *u = self.currentUser.friends[indexPath.row];
    
    cell.textLabel.text = u.username;
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FriendsEventsTableViewController *fe = [segue destinationViewController];
    User *u = self.currentUser.friends[self.tableView.indexPathForSelectedRow.row];
    
    fe.events = [self.currentUser getInvitedEventsFromFriend:u];
    
    
    

}






@end
