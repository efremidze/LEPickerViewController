//
//  UINavigationController+Extras.h
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Extras)

- (UIViewController *)popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
