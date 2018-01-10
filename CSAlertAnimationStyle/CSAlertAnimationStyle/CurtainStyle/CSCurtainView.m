//
//  CSCurtainView.m
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import "CSCurtainView.h"
#import "UIView+Layout.h"

#define ROW_COUNT 3 // 每行显示3个

@implementation CSCurtainView

- (instancetype)init {
    return  [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeButton.size = CGSizeMake(35, 35);
        _closeButton.right = [[UIScreen mainScreen] bounds].size.width - 15;
        _closeButton.y = 30;
        [_closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closeButton];
    }
    return self;
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
}

- (void)setModels:(NSArray<CSImageButtonModel *> *)models {
    
    if (CGSizeEqualToSize(CGSizeZero, _itemSize)) {
        _itemSize = CGSizeMake(60, 90);
    }
    CGFloat _gap = 35;
    CGFloat _space = (self.width - ROW_COUNT * _itemSize.width) / (ROW_COUNT + 1);
    
    _items = [NSMutableArray arrayWithCapacity:models.count];
    [models enumerateObjectsUsingBlock:^(CSImageButtonModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger l = idx % ROW_COUNT;
        NSInteger v = idx / ROW_COUNT;
        
        CSImageButton *item = [CSImageButton buttonWithType:UIButtonTypeCustom];
        item.userInteractionEnabled = YES;
        [self addSubview:item];
        [_items addObject:item];
        item.titleLabel.font = [UIFont systemFontOfSize:15];
        [item setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [item setTitle:model.text forState:UIControlStateNormal];
        [item setImage:model.icon forState:UIControlStateNormal];
        [item imagePosition:CSImageButtonPositionTop spacing:10 imageViewResize:CGSizeMake(50, 50)];
        item.tag = idx;
        [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        item.size = CGSizeMake(_itemSize.width, _itemSize.height + 20);
        item.x = _space + (_itemSize.width  + _space) * l;
        item.y = _gap + (_itemSize.height + _gap) * v + 45;
        if (idx == models.count - 1) {
            self.height = item.bottom + 20;
        }
    }];
}

- (void)close:(UIButton *)sender {
    if (nil != self.closeClicked) {
        self.closeClicked(sender);
    }
}

- (void)itemClicked:(CSImageButton *)button {
    if (nil != self.didClickItems) {
        self.didClickItems(self, button.tag);
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
