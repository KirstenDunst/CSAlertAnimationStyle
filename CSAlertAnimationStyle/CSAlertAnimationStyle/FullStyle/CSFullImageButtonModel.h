//
//  CSFullImageButtonModel.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSFullImageButtonModel : NSObject
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *text;
+ (instancetype)modelWithTitle:(NSString *)title image:(UIImage *)image;

@end

typedef NS_ENUM(NSInteger, CSFullImageButtonPosition) {
    CSFullImageButtonPositionLeft = 0,    // 图片在左，文字在右，默认
    CSFullImageButtonPositionRight,       // 图片在右，文字在左
    CSFullImageButtonPositionTop,         // 图片在上，文字在下
    CSFullImageButtonPositionBottom,      // 图片在下，文字在上
};

@interface CSFullImageButton : UIButton

- (void)imagePosition:(CSFullImageButtonPosition)postion spacing:(CGFloat)spacing;
- (void)imagePosition:(CSFullImageButtonPosition)postion spacing:(CGFloat)spacing imageViewResize:(CGSize)size;


@end
