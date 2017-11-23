//
//  ZZPublishViewController.m
//  ZZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/20.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZPublishViewController.h"

@interface ZZPublishViewController ()

@end

@implementation ZZPublishViewController

- (id)init
{
    if (self = [super init]) {
        [self.navigationItem setTitle:@"发布"];
    }
    return self;
}

- (void)viewDidLoad {
    [self setStepArray:@[@"A", @"B", @"A"]];
    [super viewDidLoad];
    [self setJz_navigationBarTintColor:[UIColor whiteColor]];
    
    if (self.navigationController.childViewControllers.firstObject == self) {
        UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithTitle:@"dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
        [self.navigationItem setLeftBarButtonItem:dismiss];
        
        UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 60)];
        [popButton setTitle:@"dismiss" forState:UIControlStateNormal];
        [popButton setBackgroundColor:[UIColor greenColor]];
        [popButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:popButton];
    }
}


- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
