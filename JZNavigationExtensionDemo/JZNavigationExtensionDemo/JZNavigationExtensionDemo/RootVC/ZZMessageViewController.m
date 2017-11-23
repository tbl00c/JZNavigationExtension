//
//  ZZMessageViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZMessageViewController.h"

@interface ZZMessageViewController ()

@end

@implementation ZZMessageViewController

- (id)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
        [self.navigationItem setTitle:@"消息"];
        [self.tabBarItem setImage:[[UIImage imageNamed:@"tab_message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_message_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return self;
}

- (void)viewDidLoad {
    [self setStepArray:@[@"A", @"A", @"C", @"A"]];
    [super viewDidLoad];
    
    [self setJz_navigationBarTintColor:[UIColor whiteColor]];
}

@end
