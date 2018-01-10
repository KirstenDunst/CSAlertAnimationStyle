//
//  CSUnderlineTextField.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSUnderlineTextField : UITextField
@property (nonatomic, strong) UIColor *underlineColor;
@end

@interface CSKeyboardView : UIView

@property (nonatomic, copy) void (^nextClickedBlock)(CSKeyboardView *keyboardView, UIButton *button);
@property (nonatomic, copy) void (^loginClickedBlock)(CSKeyboardView *keyboardView);

@property (nonatomic, strong) CSUnderlineTextField *numberField;
@property (nonatomic, strong) CSUnderlineTextField *passwordField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) NSArray<UIButton *> *buttons;

@end

@interface CSKeyboardView2 : UIView

@property (nonatomic, copy) void (^gobackClickedBlock)(CSKeyboardView2 *keyboardView, UIButton *button);

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) CSUnderlineTextField *numberField;
@property (nonatomic, strong) CSUnderlineTextField *codeField;
@property (nonatomic, strong) UIButton *codeButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *gobackButton;

@end

@interface CSKeyboardView3 : UIView

@property (nonatomic, copy) void (^senderClickedBlock)(CSKeyboardView3 *keyboardView, UIButton *button);

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *senderButton;

@end
