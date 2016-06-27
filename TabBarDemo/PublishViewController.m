//
//  PublishViewController.m
//  TabBarDemo
//
//  Created by sks on 16/6/27.
//  Copyright © 2016年 NJ. All rights reserved.
//

#import "PublishViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface PublishViewController ()

@end

@implementation PublishViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发布需求";
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self customCloseButton];
}

#pragma mark -- 基本设置 navigation
// 关闭按钮
- (void)customCloseButton
{
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeBtnAction)];
    self.navigationItem.leftBarButtonItem = closeBtn;
}

// 模态退出
- (void)closeBtnAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
