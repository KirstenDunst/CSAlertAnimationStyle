//
//  CSSideImageButtonModel.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSSideImageButtonModel : NSObject
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *text;
+ (instancetype)modelWithTitle:(NSString *)title image:(UIImage *)image;

@end

typedef NS_ENUM(NSInteger, CSSideImageButtonPosition) {
    CSSideImageButtonPositionLeft = 0,    // 图片在左，文字在右，默认
    CSSideImageButtonPositionRight,       // 图片在右，文字在左
    CSSideImageButtonPositionTop,         // 图片在上，文字在下
    CSSideImageButtonPositionBottom,      // 图片在下，文字在上
};

@interface CSSideImageButton : UIButton

- (void)imagePosition:(CSSideImageButtonPosition)postion spacing:(CGFloat)spacing;
- (void)imagePosition:(CSSideImageButtonPosition)postion spacing:(CGFloat)spacing imageViewResize:(CGSize)size;
@end
