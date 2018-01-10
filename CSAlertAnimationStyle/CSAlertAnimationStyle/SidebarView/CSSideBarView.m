//
//  CSSideBarView.m
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import "CSSideBarView.h"
#import "UIView+Layout.h"

@interface CSSideBarView ()

@property (nonatomic, strong) CSSideImageButton *settingItem;
@property (nonatomic, strong) CSSideImageButton *nightItem;

@end

@implementation CSSideBarView

- (instancetype)init {
    if (self = [super init]) {
        _settingItem = [self itemWithText:@"设置" imageNamed:@"sidebar_settings"];
        [self addSubview:_settingItem];
        _nightItem = [self itemWithText:@"夜间模式" imageNamed:@"sidebar_NightMode"];
        [self addSubview:_nightItem];
    }
    return self;
}
static inline bool isIPhoneX () {
    UIUserInterfaceIdiom idiom = [UIDevice currentDevice].userInterfaceIdiom;
    if (idiom == UIUserInterfaceIdiomPhone) {
        return [NSStringFromCGSize([UIScreen mainScreen].bounds.size) isEqualToString:@"{375, 812}"];
    }
    return NO;
}
static inline CGFloat zh_safeAreaHeight () {
    return isIPhoneX() ? 34 : 0;
}
- (CSSideImageButton *)itemWithText:(NSString *)text imageNamed:(NSString *)imageNamed {
    CSSideImageButton *item = [CSSideImageButton buttonWithType:UIButtonTypeCustom];
    item.userInteractionEnabled = YES;
    item.exclusiveTouch = YES;
    item.titleLabel.font = [UIFont systemFontOfSize:13];
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    item.size = CGSizeMake(60, 90);
    item.bottom = [[UIScreen mainScreen] bounds].size.height - 20 - zh_safeAreaHeight();
    item.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [item setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    [item setTitle:text forState:UIControlStateNormal];
    [item imagePosition:CSSideImageButtonPositionTop spacing:10 imageViewResize:CGSizeMake(30, 30)];
    return item;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _settingItem.x =  50;
    _nightItem.right = self.width - 50;
}

- (void)setModels:(NSArray<NSString *> *)models {
    _items = @[].mutableCopy;
    CGFloat _gap = 15;
    [models enumerateObjectsUsingBlock:^(NSString *text, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CSSideImageButton *item = [CSSideImageButton buttonWithType:UIButtonTypeCustom];
        item.userInteractionEnabled = YES;
        item.exclusiveTouch = YES;
        item.titleLabel.font = [UIFont systemFontOfSize:15];
        item.imageView.contentMode = UIViewContentModeCenter;
        [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        item.imageView.contentMode = UIViewContentModeScaleAspectFit;
        NSString *imageNamed = [NSString stringWithFormat:@"sidebar_%@", text];
        [item setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
        [item setTitle:text forState:UIControlStateNormal];
        item.size = CGSizeMake(150, 50);
        item.y = (_gap + item.height) * idx + 150;
        item.centerX = self.width / 2;
        [item imagePosition:CSSideImageButtonPositionLeft spacing:25 imageViewResize:CGSizeMake(25, 25)];
        [self addSubview:item];
        [_items addObject:item];
        item.tag = idx;
        [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)itemClicked:(CSSideImageButton *)sender {
    if (nil != self.didClickItems) {
        self.didClickItems(self, sender.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
