//
//  CSPickerView.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSPickerView : UIView

@property (nonatomic, strong, readonly) UIPickerView *pickerView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UIButton *saveButton;
@property (nonatomic, strong, readonly) UIButton *cancelButton;

@property (nonatomic, copy) void (^saveClickedBlock)(CSPickerView *pickerView);
@property (nonatomic, copy) void (^cancelClickedBlock)(CSPickerView *pickerView);

@property (nonatomic, strong, readonly) NSString *selectedTimeString;
//时间戳
@property (nonatomic, assign, readonly) NSInteger selectedTimestamp;

@end
