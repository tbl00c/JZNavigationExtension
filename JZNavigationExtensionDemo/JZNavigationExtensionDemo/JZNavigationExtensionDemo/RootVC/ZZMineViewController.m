//
//  ZZMineViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZMineViewController.h"

@interface ZZMineViewController ()

@end

@implementation ZZMineViewController

- (id)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
        [self.navigationItem setTitle:@"我的"];
        [self.tabBarItem setImage:[[UIImage imageNamed:@"tab_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_me_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return self;
}

- (void)viewDidLoad {
    [self setStepArray:@[@"A", @"B", @"A", @"C", @"A", @"A", @"C", @"A"]];
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.jz_navigationBarTintColor = [UIColor redColor];
}

@end
