//
//  CSCurtainView.h
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSImageButtonModel.h"

@interface CSCurtainView : UIView

@property (nonatomic, strong) NSArray<CSImageButtonModel *> *models;
@property (nonatomic, strong, readonly) NSMutableArray<CSImageButton *> *items;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, copy) void (^closeClicked)(UIButton *closeButton);
@property (nonatomic, copy) void (^didClickItems)(CSCurtainView *curtainView, NSInteger index);

@end
