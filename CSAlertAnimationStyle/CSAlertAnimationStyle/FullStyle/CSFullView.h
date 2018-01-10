//
//  CSFullView.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSFullImageButtonModel.h"

#define ROW_COUNT 4 // 每行显示4个
#define ROWS 2      // 每页显示2行
#define PAGES 2     // 共2页

@interface CSFullView : UIView

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, strong) NSArray<CSFullImageButtonModel *> *models;
@property (nonatomic, strong, readonly) NSMutableArray<CSFullImageButton *> *items;

@property (nonatomic, copy) void (^didClickFullView)(CSFullView *fullView);
@property (nonatomic, copy) void (^didClickItems)(CSFullView *fullView, NSInteger index);

- (void)endAnimationsCompletion:(void (^)(CSFullView *fullView))completion; // 动画结束后执行block

@end
