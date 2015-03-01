//
//  DatePickerViewController.m
//  ND Event App
//
//  Created by Mary Connolly on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "DatePickerViewController.h"


@implementation DatePickerViewController

-(void) viewWillDisappear:(BOOL)animated
{
    [self.delegate sendDataToA:self.startDatePicker.date andEnd:self.endDatePicker.date];
}

@end