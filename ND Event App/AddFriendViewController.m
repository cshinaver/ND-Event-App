//
//  AddFriendViewController.m
//  ND Event App
//
//  Created by Mary Connolly on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "AddFriendViewController.h"

@interface AddFriendViewController ()

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentUser = [User getUser: @"Mary"];
    
    //hide popup label
    [self.popupLabel setHidden:YES];
    
    self.allUsers = [User getAllUsers];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.addFriendLabel.text = @"Enter username:";
    [self.addFriendButton setTitle:@"Add friend!" forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.allUsers.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    User *u = self.allUsers[row];
    return u.username;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFriend:(id)sender {
    
    User *u = self.allUsers[[self.picker selectedRowInComponent:0]];
    
    [self.currentUser.friends addObject: u];
    
    [self.currentUser saveToDatabase];
    
    [self.popupLabel setHidden:NO];
    
    if ([self.currentUser isFriendsWith:u])
    {
        self.popupLabel.text = [[NSString alloc] initWithFormat:@"You are now friends with %@", u.username];
    }
    
    else
    {
        self.popupLabel.text = @"Failed.";
    }
    
}
@end
