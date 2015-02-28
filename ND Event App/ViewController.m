//
//  ViewController.m
//  ND Event App
//
//  Created by Mary Connolly on 2/27/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.Friends.title = @"Friends";
    self.Events.title = @"Events";
    self.Map.title = @"Map";
    self.Host.title = @"Host";
    self.Settings.title = @"Settings";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
