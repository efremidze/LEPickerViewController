//
//  LEPickerObject.h
//  LEPickerViewController
//
//  Created by Lasha Efremidze on 4/10/15.
//  Copyright (c) 2015 Lasha Efremidze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEPickerObject : NSObject

@property (nonatomic, strong) id value;
@property (nonatomic, strong) NSString *displayText;

+ (LEPickerObject *)pickerObjectWithValue:(id)value displayText:(NSString *)displayText;

@end
