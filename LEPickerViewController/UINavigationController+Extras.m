//
//  UINavigationController+Extras.m
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import "UINavigationController+Extras.h"

@implementation UINavigationController (Extras)

- (UIViewController *)popViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        if (completion) {
            completion();
        }
    }];
    
    UIViewController *viewController = [self popViewControllerAnimated:YES];
    
    [CATransaction commit];
    
    return viewController;
}

@end
