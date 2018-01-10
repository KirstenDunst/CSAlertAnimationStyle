//
//  CSWallView.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSWallViewLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSWallItemModel : NSObject

+ (instancetype)modelWithImage:(UIImage *)image text:(NSString *)text;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *text;

@end

@protocol CSWallViewDelegateConfig, CSWallViewDelegate;

@interface CSWallView : UIView

@property (nonatomic, weak, nullable) id <CSWallViewDelegate> delegate;
@property (nonatomic, strong, readonly) UILabel *wallFooterLabel;
@property (nonatomic, strong, readonly) UILabel *wallHeaderLabel;

@property (nonatomic, strong) NSArray<NSArray<CSWallItemModel *> *> *models;

@property (nonatomic, copy) void (^didClickHeader)(CSWallView *wallView);
@property (nonatomic, copy) void (^didClickFooter)(CSWallView *wallView);

- (void)autoAdjustFitHeight;

@end

@protocol CSWallViewDelegate <NSObject>
@optional
// 点击了每个item事件
- (void)wallView:(CSWallView *)wallView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol CSWallViewDelegateConfig <CSWallViewDelegate>
@optional
// 布局相关
- (CSWallViewLayout *)layoutOfItemInWallView:(CSWallView *)wallView;
// 外观颜色相关
- (CSWallViewAppearance *)appearanceOfItemInWallView:(CSWallView *)wallView;


@end

NS_ASSUME_NONNULL_END
