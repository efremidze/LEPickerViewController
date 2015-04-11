//
//  LEPickerViewController.m
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import "LEPickerViewController.h"

#import "UINavigationController+Extras.h"

@interface LEPickerViewController ()

@end

@implementation LEPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self style];
}

#pragma mark - Styling

- (void)style
{
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pickerObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCellStyleDefault";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    LEPickerObject *object = [self pickerObjectForIndexPath:indexPath];
    
    cell.textLabel.text = object.displayText;
    
    BOOL isSelected = [object.value isEqual:self.selectedPickerObject.value];
    cell.accessoryType = (isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedPickerObject = [self pickerObjectForIndexPath:indexPath];
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    if ([self.delegate respondsToSelector:@selector(pickerViewController:didSelectPickerObject:)]) {
        [self.delegate pickerViewController:self didSelectPickerObject:self.selectedPickerObject];
    }
    
    if (self.willDismissCompletionHandler) {
        self.willDismissCompletionHandler(self.selectedPickerObject);
    }
    
    [self.navigationController popViewControllerAnimated:YES completion:^{
        if (self.didDismissCompletionHandler) {
            self.didDismissCompletionHandler(self.selectedPickerObject);
        }
    }];
}

#pragma mark - Helpers

- (LEPickerObject *)pickerObjectForIndexPath:(NSIndexPath *)indexPath
{
    if (self.pickerObjects.count > indexPath.row)
        return self.pickerObjects[indexPath.row];
    return nil;
}

@end
