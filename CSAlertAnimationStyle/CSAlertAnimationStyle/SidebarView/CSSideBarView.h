//
//  CSSideBarView.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSSideImageButtonModel.h"

@interface CSSideBarView : UIView

@property (nonatomic, strong) NSArray<NSString *> *models;
@property (nonatomic, strong, readonly) NSMutableArray<CSSideImageButton *> *items;
@property (nonatomic, copy) void (^didClickItems)(CSSideBarView *sidebarView, NSInteger index);

@end
