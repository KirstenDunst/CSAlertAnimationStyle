//
//  ViewController.m
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"
#import "UIColor+Extend.h"
#import "CSAlertStyleOne.h"
#import <zhPopupController/zhPopupController.h>
#import "CSOverflyView.h"
#import "CSCurtainView.h"
#import "CSSideBarView.h"
#import "CSFullView.h"
#import "TextViewController.h"
#import "CSWallView.h"
#import "CSUnderlineTextField.h"
#import "CSPickerView.h"


@interface ViewController ()<CSWallViewDelegate>
@property (nonatomic,strong)NSArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"alert动画弹出样式分类";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpForNewView];
}
- (NSArray *)arr{
    if (!_arr) {
        _arr = @[@"Alert style1",@"Alert style2",@"Overfly style",@"Qzone style",@"Sidebar style",@"Full style",@"Shared style",@"Keyboard style1",@"Keyboard style2",@"Picker style"];
    }
    return _arr;
}
- (void)setUpForNewView{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scroll];
    for (int i = 0; i<self.arr.count; i++) {
        UIButton *myCreateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        myCreateButton.frame = CGRectMake(50, 40+80*i, self.view.frame.size.width-100, 40);
        myCreateButton.tag = 100+i;
        [myCreateButton setBackgroundColor:[UIColor blueColor]];
        [myCreateButton setTintColor:[UIColor whiteColor]];
        [myCreateButton setTitle:self.arr[i] forState:UIControlStateNormal];
        [myCreateButton addTarget:self action:@selector(buttonChoose:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:myCreateButton];
    }
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, 40+80*self.arr.count);
}

- (void)buttonChoose:(UIButton *)sender{
    NSString *selName = [NSString stringWithFormat:@"example%lu", sender.tag-100 + 1];
    SEL sel = NSSelectorFromString(selName);
    if ([self respondsToSelector:sel]) {
        self.title = self.arr[sender.tag-100];
        [self performSelector:sel withObject:nil afterDelay:0];
    }
}

#pragma mark -------Alert style1
- (void)example1{
    CSAlertStyleOne *alert = [[CSAlertStyleOne alloc] initWithTitle:@"提示"
                                                        message:@"切换城市失败，是否重试？"
                                                  constantWidth:290];
    CSAlertButton *cancelButton = [CSAlertButton buttonWithTitle:@"取消" handler:^(CSAlertButton * _Nonnull button) {
        [self.zh_popupController dismiss];
    }];
    CSAlertButton *okButton = [CSAlertButton buttonWithTitle:@"确定" handler:^(CSAlertButton * _Nonnull button) {
        [self.zh_popupController dismiss];
    }];
    cancelButton.lineColor = [UIColor colorWithHexString:@"#FC7541"];
    okButton.lineColor = cancelButton.lineColor;
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"#FC7541"] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor colorWithHexString:@"#FC7541"] forState:UIControlStateNormal];
    cancelButton.edgeInsets = UIEdgeInsetsMake(15, 0, 0, 0);
    [alert adjoinWithLeftAction:cancelButton rightAction:okButton];
    
    self.zh_popupController = [[zhPopupController alloc] init];
    [self.zh_popupController dropAnimatedWithRotateAngle:30];
    [self.zh_popupController presentContentView:alert duration:0.75 springAnimated:YES];
}
#pragma mark -------Alert style2
- (void)example2{
    CSAlertStyleOne *alertView = [[CSAlertStyleOne alloc] initWithTitle:@"先来\n告诉我们你的喜好吧"
                                                        message:@"我们会通过你的喜欢！了解你的喜好并为你推荐作品"
                                                  constantWidth:250];
    alertView.titleLabel.textColor = [UIColor r:80 g:72 b:83];
    alertView.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    alertView.messageLabel.textColor = [UIColor blackColor];
    
    CSAlertButton *button = [CSAlertButton buttonWithTitle:@"OK" handler:^(CSAlertButton * _Nonnull button) {
        [self.zh_popupController dismiss];
    }];
    button.edgeInsets = UIEdgeInsetsMake(20, 20, 25, 20);
    button.backgroundColor = [UIColor r:27 g:159 b:253];
    button.layer.cornerRadius = 5;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [alertView addAction:button];
    
    self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeBlackBlur];
    self.zh_popupController.slideStyle = zhPopupSlideStyleShrinkInOut;
    self.zh_popupController.allowPan = YES;
    // 弹出2秒后消失
    [self.zh_popupController presentContentView:alertView duration:0.75 springAnimated:YES inView:nil displayTime:2];
}
#pragma mark -------Overfly style
- (void)example3{
    NSString *title1 = @"通知", *title2 = @"一大波福利即将到来~";
    NSString *text = [NSString stringWithFormat:@"%@\n%@", title1, title2];
    NSMutableAttributedString *attiTitle = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attiTitle addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:[text rangeOfString:title1]];
    [attiTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:[text rangeOfString:title1]];
    
    [attiTitle addAttribute:NSForegroundColorAttributeName value:[UIColor r:236 g:78 b:39] range:[text rangeOfString:title2]];
    [attiTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:[text rangeOfString:title2]];
    
    [attiTitle addAttribute:NSKernAttributeName value:@1.2 range:[text rangeOfString:title2]];//字距调整
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:7];
    [attiTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];//行距调整
    
    NSString *msg = @"     两国元首重点就当前朝鲜半岛局势交换了看法。习近平强调，中方坚定不移致力于实现朝鲜半岛无核化，维护国际核不扩散体系";
    for (int i = 0; i < 3; i++) {
        msg = [msg stringByAppendingString:msg];
    }
    
    NSMutableAttributedString *attiMessage = [[NSMutableAttributedString alloc] initWithString:msg];
    [attiMessage addAttribute:NSKernAttributeName value:@1.1 range:NSMakeRange(0, [msg length])];
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle2 setLineSpacing:7];
    [attiMessage addAttribute:NSParagraphStyleAttributeName value:paragraphStyle2 range:NSMakeRange(0, [msg length])];
    [attiMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, [msg length])];
    [attiMessage addAttribute:NSForegroundColorAttributeName value:[UIColor r:49 g:49 b:39      ] range:NSMakeRange(0, [msg length])];
    
    CGFloat fac = 475; // 已知透明区域高度
    UIImage *image = [UIImage imageNamed:@"fire_arrow"];
    
    CSOverflyView *overflyView = [[CSOverflyView alloc]
                                  initWithFlyImage:image
                                  highlyRatio:(fac / image.size.height)
                                  attributedTitle:attiTitle
                                  attributedMessage:attiMessage
                                  constantWidth:290];
    overflyView.layer.cornerRadius = 4;
    overflyView.messageEdgeInsets = UIEdgeInsetsMake(10, 22, 10, 22);
    overflyView.titleLabel.backgroundColor = [UIColor whiteColor];
    overflyView.titleLabel.textAlignment = NSTextAlignmentCenter;
    overflyView.splitLine.hidden = YES;
    [overflyView reloadAllComponents];
    
    
    CSOverflyButton *btn1 = [CSOverflyButton buttonWithTitle:@"忽略" handler:^(CSOverflyButton * _Nonnull button) {
        [self.zh_popupController dismiss];
    }];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    CSOverflyButton *btn2 = [CSOverflyButton buttonWithTitle:@"查看详情" handler:^(CSOverflyButton * _Nonnull button) {
    }];
    [btn2 setTitleColor:[UIColor r:236 g:78 b:39] forState:UIControlStateNormal];
    
    [overflyView adjoinWithLeftAction:btn1 rightAction:btn2];
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.dismissOnMaskTouched = NO;
    self.zh_popupController.dismissOppositeDirection = YES;
    self.zh_popupController.slideStyle = zhPopupSlideStyleFromBottom;
    [self.zh_popupController presentContentView:overflyView duration:0.75 springAnimated:YES];
}
#pragma mark -------Qzone style
- (void)example4{
    CSCurtainView *curtainView = [[CSCurtainView alloc] init];
    curtainView.width = [[UIScreen mainScreen] bounds].size.width;
    [curtainView.closeButton setImage:[UIImage imageNamed:@"qzone_close"] forState:UIControlStateNormal];
    NSArray *imageNames = @[@"说说", @"照片", @"视频", @"签到", @"大头贴"];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:imageNames.count];
    for (NSString *imageName in imageNames) {
        UIImage *image = [UIImage imageNamed:[@"qzone_" stringByAppendingString:imageName]];
        [models addObject:[CSImageButtonModel modelWithTitle:imageName image:image]];
    }
    curtainView.models = models;
    curtainView.closeClicked = ^(UIButton *closeButton) {
        [self.zh_popupController dismissWithDuration:0.25 springAnimated:NO];
    };
    curtainView.didClickItems = ^(CSCurtainView *curtainView, NSInteger index) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:curtainView.items[index].titleLabel.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    };
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeTop;
    self.zh_popupController.allowPan = YES;
    
    self.zh_popupController.maskTouched = ^(zhPopupController * _Nonnull popupController) {
        [popupController dismissWithDuration:0.25 springAnimated:NO];
    };
    
    __weak typeof(self) weak_self = self;
    self.zh_popupController.willDismiss = ^(zhPopupController * _Nonnull popupController) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    };
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.zh_popupController presentContentView:curtainView duration:0.75 springAnimated:YES];
}
#pragma mark -------Sidebar style
- (void)example5{
    CSSideBarView *sidebarView = [CSSideBarView new];
    sidebarView.size = CGSizeMake([[UIScreen mainScreen] bounds].size.width - 90, [[UIScreen mainScreen] bounds].size.height);
    sidebarView.backgroundColor = [UIColor r:24 g:28 b:45 alphaComponent:0.8];
    sidebarView.models = @[@"我的故事", @"消息中心", @"我的收藏", @"近期阅读", @"离线阅读"];
    
    sidebarView.didClickItems = ^(CSSideBarView *sidebarView, NSInteger index) {
        [self.zh_popupController dismiss];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:sidebarView.items[index].titleLabel.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    };
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeLeft;
    self.zh_popupController.allowPan = YES;
    [self.zh_popupController presentContentView:sidebarView];
}
#pragma mark -------Full style
- (void)example6{
    CSFullView *fullView = [[CSFullView alloc] initWithFrame:self.view.frame];
    NSArray *array = @[@"文字", @"照片视频", @"头条文章", @"红包", @"直播", @"点评", @"好友圈", @"更多", @"音乐", @"商品", @"签到", @"秒拍", @"头条文章", @"红包", @"直播", @"点评"];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:array.count];
    for (NSString *string in array) {
        CSFullImageButtonModel *item = [CSFullImageButtonModel new];
        item.icon = [UIImage imageNamed:[NSString stringWithFormat:@"sina_%@", string]];
        item.text = string;
        [models addObject:item];
    }
    fullView.models = models;
    
    fullView.didClickFullView = ^(CSFullView * _Nonnull fullView) {
        [self.zh_popupController dismiss];
    };
    
    fullView.didClickItems = ^(CSFullView *fullView, NSInteger index) {
        
        __weak typeof(self) weak_self = self;
        self.zh_popupController.willDismiss = ^(zhPopupController * _Nonnull popupController) {
            TextViewController *vc = [TextViewController new];
            vc.title = fullView.items[index].titleLabel.text;
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        
        [fullView endAnimationsCompletion:^(CSFullView *fullView) {
            [self.zh_popupController dismiss];
        }];
    };
    
    self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeWhiteBlur];
    self.zh_popupController.allowPan = YES;
    [self.zh_popupController presentContentView:fullView];
    
}
#pragma mark -------Shared style
- (void)example7{
    CGRect rect = CGRectMake(100, 100, [[UIScreen mainScreen] bounds].size.width, 300);
    CSWallView *wallView = [[CSWallView alloc] initWithFrame:rect];
    wallView.wallHeaderLabel.text = @"此网页由 mp.weixin.qq.com 提供";
    wallView.wallFooterLabel.text = @"取消";
    wallView.models = [self wallModels];
    [wallView autoAdjustFitHeight];
    wallView.delegate = self;
    wallView.didClickFooter = ^(CSWallView * _Nonnull sheetView) {
        [self.zh_popupController dismiss];
    };
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
    [self.zh_popupController presentContentView:wallView];
}
// CSWallViewDelegateConfig
- (CSWallViewLayout *)layoutOfItemInWallView:(CSWallView *)wallView {
    CSWallViewLayout *layout = [CSWallViewLayout new];
    layout.itemSubviewsSpacing = 9;
    return layout;
}

- (CSWallViewAppearance *)appearanceOfItemInWallView:(CSWallView *)wallView {
    CSWallViewAppearance *appearance = [CSWallViewAppearance new];
    appearance.textLabelFont = [UIFont systemFontOfSize:10];
    return appearance;
}

// CSWallViewDelegate
- (void)wallView:(CSWallView *)wallView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CSWallItemModel *model = [self wallModels][indexPath.section][indexPath.row];
    self.zh_popupController.didDismiss = ^(zhPopupController * _Nonnull popupController) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:model.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    };
    [self.zh_popupController dismiss];
}

#define titleKey @"title"
#define imgNameKey @"imageName"

- (NSArray *)wallModels {
    NSArray *arr1 = @[@{titleKey   : @"发送给朋友",
                        imgNameKey : @"sheet_Share"},
                      
                      @{titleKey   : @"分享到朋友圈",
                        imgNameKey : @"sheet_Moments"},
                      
                      @{titleKey   : @"收藏",
                        imgNameKey : @"sheet_Collection"},
                      
                      @{titleKey   : @"分享到\n手机QQ",
                        imgNameKey : @"sheet_qq"},
                      
                      @{titleKey   : @"分享到\nQQ空间",
                        imgNameKey : @"sheet_qzone"},
                      
                      @{titleKey   : @"在QQ浏览器\n中打开",
                        imgNameKey : @"sheet_qqbrowser"}];
    
    NSArray *arr2 = @[@{titleKey   : @"查看公众号",
                        imgNameKey : @"sheet_Verified"},
                      
                      @{titleKey   : @"复制链接",
                        imgNameKey : @"sheet_CopyLink"},
                      
                      @{titleKey   : @"复制文本",
                        imgNameKey : @"sheet_CopyText"},
                      
                      @{titleKey   : @"刷新",
                        imgNameKey : @"sheet_Refresh"},
                      
                      @{titleKey   : @"调整字体",
                        imgNameKey : @"sheet_Font"},
                      
                      @{titleKey   : @"投诉",
                        imgNameKey : @"sheet_Complaint"}];
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (NSDictionary *dict in arr1) {
        NSString *text = [dict objectForKey:titleKey];
        NSString *imgName = [dict objectForKey:imgNameKey];
        [array1 addObject:[CSWallItemModel modelWithImage:[UIImage imageNamed:imgName] text:text]];
    }
    
    NSMutableArray *array2 = [NSMutableArray array];
    for (NSDictionary *dict in arr2) {
        NSString *text = [dict objectForKey:titleKey];
        NSString *imgName = [dict objectForKey:imgNameKey];
        [array2 addObject:[CSWallItemModel modelWithImage:[UIImage imageNamed:imgName] text:text]];
    }
    
    return [NSMutableArray arrayWithObjects:array1, array2, nil];
}

#pragma mark -------Keyboard style1
- (void)example8{
    CGRect rect = CGRectMake(0, 0, 300, 236);
//    登录界面
    CSKeyboardView *kbview1 = [[CSKeyboardView alloc] initWithFrame:rect];
//    注册账号界面
    CSKeyboardView2 *kbview2 = [[CSKeyboardView2 alloc] initWithFrame:rect];
    //登录按钮点击触发的事件
    kbview1.loginClickedBlock = ^(CSKeyboardView *keyboardView) {
        NSLog(@">>>>>>>%@",keyboardView.passwordField.text);
        [self.zh_popupController dismiss];
    };
    //点击注册账号的处理
    kbview1.nextClickedBlock = ^(CSKeyboardView *keyboardView, UIButton *button) {
        [UIView transitionWithView:self.zh_popupController.popupView duration:0.65 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [self.zh_popupController.popupView addSubview:kbview2];
            [kbview2.numberField becomeFirstResponder];
        } completion:^(BOOL finished) {
            if ([self.zh_popupController.popupView.subviews containsObject:keyboardView]) {
                [keyboardView removeFromSuperview];
            }
        }];
        
    };
    
    __weak typeof(self) weak_self = self;
    __weak typeof(kbview1) weak_kbview1 = kbview1;
    //点击注册账号页面的返回按钮触发事件
    kbview2.gobackClickedBlock = ^(CSKeyboardView2 *keyboardView, UIButton *button) {
        __strong typeof(weak_self) strong_self = weak_self;
        __strong typeof(weak_kbview1) strong_kbview = weak_kbview1;
        [UIView transitionWithView:strong_self.zh_popupController.popupView duration:0.65 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [strong_self.zh_popupController.popupView addSubview:strong_kbview];
            [strong_kbview.numberField becomeFirstResponder];
        } completion:^(BOOL finished) {
            if ([strong_self.zh_popupController.popupView.subviews containsObject:keyboardView]) {
                [keyboardView removeFromSuperview];
            }
        }];
        
    };
    
    self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeBlackBlur];
    self.zh_popupController.layoutType = zhPopupLayoutTypeCenter;
    [self.zh_popupController presentContentView:kbview1 duration:0.25 springAnimated:NO];
}
#pragma mark -------Keyboard style2
- (void)example9{
    CGRect rect = CGRectMake(0, 0, self.view.width, 60);
    CSKeyboardView3 *kbview = [[CSKeyboardView3 alloc] initWithFrame:rect];
//    发送按钮点击触发的事件
    kbview.senderClickedBlock = ^(CSKeyboardView3 *keyboardView, UIButton *button) {
        [self.zh_popupController dismiss];
    };
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
    //    self.zh_popupController.offsetSpacingOfKeyboard = 30; // 可以设置与键盘之间的间距
    [self.zh_popupController presentContentView:kbview duration:0.25 springAnimated:NO];
}
#pragma mark -------Picker style
- (void)example10{
    CGRect rect = CGRectMake(0, 0, self.view.width, 275);
    CSPickerView *pView = [[CSPickerView alloc] initWithFrame:rect];
    pView.saveClickedBlock = ^(CSPickerView *pickerView) {
        NSString *message = [NSString stringWithFormat:@"%@\n%lu", pickerView.selectedTimeString, pickerView.selectedTimestamp];
        self.zh_popupController.didDismiss = ^(zhPopupController * _Nonnull popupController) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        };
        [self.zh_popupController dismiss];
    };
    
    pView.cancelClickedBlock = ^(CSPickerView *pickerView) {
        [self.zh_popupController dismiss];
    };
    
    self.zh_popupController = [zhPopupController new];
    self.zh_popupController.layoutType = zhPopupLayoutTypeBottom;
    self.zh_popupController.dismissOnMaskTouched = NO;
    [self.zh_popupController presentContentView:pView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
