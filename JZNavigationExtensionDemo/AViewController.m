//
//  AViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "AViewController.h"
#import "JZNavigationExtension.h"

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"A"];
    
    self.jz_navigationBarTintColor = [UIColor redColor];
    
    UIBarButtonItem *pushItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    [self.navigationItem setRightBarButtonItem:pushItem];
    
    UIButton *jumpButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 150, 60)];
    [jumpButton setTitle:@"push" forState:UIControlStateNormal];
    [jumpButton setBackgroundColor:[UIColor redColor]];
    [jumpButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpButton];
}

- (void)push {
    UIViewController *vc = [[NSClassFromString(@"BViewController") alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
