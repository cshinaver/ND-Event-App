//
//  signUpViewController.m
//  ND Event App
//
//  Created by Anna Jo McMahon on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "signUpViewController.h"
#import "User.h"

@interface signUpViewController ()

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

- (IBAction)createAccount:(id)sender {
    User *new = (User *)[User object];
    new.username = self.usernameTextField.text;
    new.password = self.passwordTextField.text;
    new.phoneNumber = self.phoneNumberTextField.text;
    new.email = self.emailTextField.text;
    new.events = [NSMutableArray new];
    new.friends = [NSMutableArray new];
    
    
    [new signUp:nil];
    [User login:new.username password:new.password];
    [User getUser:new.username];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
