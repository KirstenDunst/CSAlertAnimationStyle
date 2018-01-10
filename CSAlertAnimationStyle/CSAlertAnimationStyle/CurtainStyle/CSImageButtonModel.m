//
//  CSImageButtonModel.m
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import "CSImageButtonModel.h"
#import "UIView+Layout.h"

@implementation CSImageButtonModel

+ (instancetype)modelWithTitle:(NSString *)title image:(UIImage *)image {
    CSImageButtonModel *model = [CSImageButtonModel new];
    model.text = title;
    model.icon = image;
    return model;
}

@end

@interface CSImageButton ()

@property (nonatomic, assign, readonly) CGSize adjustImageSize;
@property (nonatomic, assign, readonly) CGFloat adjustSpacing;
@property (nonatomic, assign, readonly) CSImageButtonPosition adjustPosition;
@property (nonatomic, assign, readonly) BOOL isNeedAdjust;

@end

@implementation CSImageButton

- (void)imagePosition:(CSImageButtonPosition)postion spacing:(CGFloat)spacing {
    _adjustPosition = postion;
    _adjustSpacing = spacing;
    _isNeedAdjust = YES;
    [self setNeedsLayout];
}

- (void)imagePosition:(CSImageButtonPosition)postion spacing:(CGFloat)spacing imageViewResize:(CGSize)size {
    _adjustPosition = postion;
    _adjustImageSize = size;
    _adjustSpacing = spacing;
    _isNeedAdjust = YES;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!_isNeedAdjust) return;
    if (_adjustSpacing <= 0) _adjustSpacing = 10;
    if (CGSizeEqualToSize(CGSizeZero, _adjustImageSize)) _adjustImageSize = self.imageView.size;
    [self _adjustImagePosition:_adjustPosition];
}

- (void)_adjustImagePosition:(CSImageButtonPosition)position {
    CGSize imageSize = _adjustImageSize;
    CGSize labelSize = self.titleLabel.intrinsicContentSize;
    
    switch (position) {
        case CSImageButtonPositionLeft: {
            CGFloat _allW = imageSize.width + labelSize.width + _adjustSpacing;
            CGFloat _padding = (self.bounds.size.width - _allW) / 2;
            CGFloat imageY = (self.bounds.size.height - imageSize.height) / 2;
            self.imageView.frame = CGRectMake(_padding, imageY, imageSize.width, imageSize.height);
            CGFloat labelX = CGRectGetMaxX(self.imageView.frame) + _adjustSpacing;
            CGFloat labelY = (self.bounds.size.height - labelSize.height) / 2;
            self.titleLabel.frame = CGRectMake(labelX, labelY, labelSize.width, labelSize.height);
        } break;
            
        case CSImageButtonPositionRight: {
            CGFloat _allW = imageSize.width + labelSize.width + _adjustSpacing;
            CGFloat _padding = (self.bounds.size.width - _allW) / 2;
            CGFloat labelY = (self.bounds.size.height - labelSize.height) / 2;
            self.titleLabel.frame = CGRectMake(_padding, labelY, labelSize.width, labelSize.height);
            CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + _adjustSpacing;
            CGFloat imageY = (self.bounds.size.height - imageSize.height) / 2;
            self.imageView.frame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
        } break;
            
        case CSImageButtonPositionTop: {
            CGFloat _allH = imageSize.height + labelSize.height + _adjustSpacing;
            CGFloat _padding = (self.height - _allH) / 2;
            CGFloat imageX = (self.bounds.size.width - imageSize.width) / 2;
            self.imageView.frame = CGRectMake(imageX, _padding, imageSize.width, imageSize.height);
            CGFloat labelX = (self.size.width - labelSize.width) / 2;
            CGFloat labelY = CGRectGetMaxY(self.imageView.frame) + _adjustSpacing;
            self.titleLabel.frame = CGRectMake(labelX, labelY, labelSize.width, labelSize.height);
        } break;
            
        case CSImageButtonPositionBottom: {
            CGFloat _allH = imageSize.height + labelSize.height + _adjustSpacing;
            CGFloat _padding = (self.height - _allH) / 2;
            CGFloat labelX = (self.size.width - labelSize.width) / 2;
            self.titleLabel.frame = CGRectMake(labelX, _padding, labelSize.width, labelSize.height);
            CGFloat imageX = (self.bounds.size.width - imageSize.width) / 2;
            CGFloat imageY = CGRectGetMaxY(self.titleLabel.frame) + _adjustSpacing;
            self.imageView.frame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
        } break;
            
        default: break;
    }
}
@end
