//
//  ZZHomeViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZHomeViewController.h"

@implementation ZZHomeViewController

- (id)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
        [self.navigationItem setTitle:@"首页"];
        [self.tabBarItem setImage:[[UIImage imageNamed:@"tab_homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_homepage_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return self;
}

- (void)viewDidLoad {
    [self setStepArray:@[@"B", @"A", @"B", @"B", @"A", @"B"]];
    
    [super viewDidLoad];
    
    [self setJz_wantsNavigationBarVisible:NO];
}

@end
