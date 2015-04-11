//
//  TableViewController.m
//  LEPickerViewControllerDemo
//
//  Created by Lasha Efremidze on 4/11/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import "TableViewController.h"

#import "LEPickerViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCellStyleDefault";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = @"Favorite Color";
    cell.detailTextLabel.text = @"Red";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    LEPickerViewController *viewController = [LEPickerViewController new];
    viewController.title = cell.textLabel.text;
    viewController.pickerObjects = ((^{
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:[LEPickerObject pickerObjectWithValue:@0 displayText:@"Red"]];
        [array addObject:[LEPickerObject pickerObjectWithValue:@1 displayText:@"Green"]];
        [array addObject:[LEPickerObject pickerObjectWithValue:@2 displayText:@"Blue"]];
        return array;
    })());
    viewController.selectedPickerObject = ((^{
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", NSStringFromSelector(@selector(displayText)), cell.detailTextLabel.text];
        return [[viewController.pickerObjects filteredArrayUsingPredicate:predicate] firstObject];
    })());
    viewController.didDismissCompletionHandler = ^(LEPickerObject *pickerObject) {
        NSLog(@"value: %@\ndisplayText: %@", pickerObject.value, pickerObject.displayText);
        cell.detailTextLabel.text = pickerObject.displayText;
    };
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
