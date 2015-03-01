//
//  loginViewController.m
//  ND Event App
//
//  Created by Anna Jo McMahon on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "loginViewController.h"
#import "User.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    if ([PFUser currentUser])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)login:(id)sender {
    [User login:self.usernameTextField.text password:self.passwordTextField.text];
    [User getUser:self.usernameTextField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
