//
//  CViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "CViewController.h"
#import "JZNavigationExtension.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"C"];
    
    self.jz_navigationBarTintColor = [UIColor blueColor];
    
    UIBarButtonItem *pushItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    [self.navigationItem setRightBarButtonItem:pushItem];
    
    UIButton *jumpButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 150, 60)];
    [jumpButton setTitle:@"push" forState:UIControlStateNormal];
    [jumpButton setBackgroundColor:[UIColor redColor]];
    [jumpButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpButton];
}

- (void)push {
    UIViewController *vc = [[NSClassFromString(@"DViewController") alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
