//
//  DatePickerViewController.h
//  ND Event App
//
//  Created by Mary Connolly on 3/1/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol senddataProtocol <NSObject>

-(void)sendDataToA:(NSDate *)start andEnd:(NSDate *)end;

@end

@interface DatePickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;

@property(nonatomic, assign)id delegate;

@end
