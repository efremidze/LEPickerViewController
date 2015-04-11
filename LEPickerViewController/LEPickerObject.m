//
//  LEPickerObject.m
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import "LEPickerObject.h"

@implementation LEPickerObject

+ (LEPickerObject *)pickerObjectWithValue:(id)value displayText:(NSString *)displayText;
{
    LEPickerObject *object = [LEPickerObject new];
    object.value = value;
    object.displayText = displayText;
    return object;
}

@end
