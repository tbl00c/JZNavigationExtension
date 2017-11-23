//
//  ZZCateViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZCateViewController.h"

@interface ZZCateViewController ()

@end

@implementation ZZCateViewController

- (id)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
        [self.navigationItem setTitle:@"分类"];
        [self.tabBarItem setImage:[[UIImage imageNamed:@"tab_willbuy"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_willbuy_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return self;
}

- (void)viewDidLoad {
    [self setStepArray:@[@"C", @"B", @"C", @"C", @"A", @"A", @"C", @"A"]];
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.jz_navigationBarBackgroundAlpha = 0;
}

@end
