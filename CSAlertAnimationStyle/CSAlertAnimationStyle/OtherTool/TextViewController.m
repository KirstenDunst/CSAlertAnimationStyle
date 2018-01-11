//
//  TextViewController.m
//  CSAlertAnimationStyle
//
//  Created by CSX on 2018/1/10.
//  Copyright © 2018年 宗盛商业. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myCreateButton.frame = CGRectMake(0, 0, 100, 100);
    [myCreateButton setBackgroundColor:[UIColor grayColor]];
    [myCreateButton setTitle:@"Choose" forState:UIControlStateNormal];
    [myCreateButton addTarget:self action:@selector(text) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myCreateButton];
}
//三目运算符取多维数组里面的下一个数
- (void)text{
    NSArray *arr = @[@[@2,@3,@5,@7],@[@9,@10,@14],@[@19.25,@29]] ;
    NSInteger section,row;
    section = 1; row = 2;
    
    NSNumber *number = arr[row+1 == [arr[section]count] ?section+1:section][row+1 == [arr[section]count] ? 0:row+1];
    NSLog(@">>>>>%@",number);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
