//
//  LEPickerViewController.h
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LEPickerObject.h"

@class LEPickerViewController;

typedef void(^LEPickerViewCompletionHandler)(LEPickerObject *);

@protocol LEPickerViewControllerDelegate <NSObject>

@optional
- (void)pickerViewController:(LEPickerViewController *)viewController didSelectPickerObject:(LEPickerObject *)pickerObject;

@end

@interface LEPickerViewController : UITableViewController

@property (nonatomic, weak) id<LEPickerViewControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *pickerObjects;

@property (nonatomic, strong) LEPickerObject *selectedPickerObject;

@property (nonatomic, copy) LEPickerViewCompletionHandler willDismissCompletionHandler;
@property (nonatomic, copy) LEPickerViewCompletionHandler didDismissCompletionHandler;

@end
