//
//  CSAlertStyleOne.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSAlertButton : UIButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType NS_UNAVAILABLE;
+ (instancetype)buttonWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(CSAlertButton *button))handler;

@property (nonatomic, assign) UIColor *lineColor;   // 线条颜色
@property (nonatomic, assign) CGFloat lineWidth;    // 线宽
@property (nonatomic, assign) UIEdgeInsets edgeInsets; //边缘留白 top -> 间距 / bottom -> 最底部留白(根据不同情况调整不同间距)

@end

@interface CSAlertStyleOne : UIView

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *messageLabel;

- (instancetype)initWithTitle:(nullable NSString *)title
                      message:(nullable NSString *)message
                constantWidth:(CGFloat)constantWidth;

/// 子视图按钮(zhOverflyButton)的高度，默认49
@property (nonatomic, assign) CGFloat subOverflyButtonHeight;

/// 纵向依次向下添加
- (void)addAction:(nonnull CSAlertButton *)action;

/// 水平方向两个button
- (void)adjoinWithLeftAction:(CSAlertButton *)leftAction rightAction:(CSAlertButton *)rightAction;

@end

NS_ASSUME_NONNULL_END
