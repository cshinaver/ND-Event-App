//
//  startupNavigationControllerViewController.m
//  ND Event App
//
//  Created by Anna Jo McMahon on 2/28/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "startupNavigationControllerViewController.h"
#import "User.h"
@interface startupNavigationControllerViewController ()

@end

@implementation startupNavigationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	PFUser *currentUser = [PFUser currentUser];
	if (currentUser) {
		// do stuff with the user
	} else {
		// show the signup or login screen
	}
	
	
	
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
