//
//  ZZBaseViewController.m
//  JZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/23.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "ZZBaseViewController.h"

@implementation ZZBaseViewController

- (id)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if (self.stepArray.count > 0) {
        UIBarButtonItem *pushItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
        [self.navigationItem setRightBarButtonItem:pushItem];
        
        UIButton *jumpButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 60)];
        [jumpButton setTitle:@"push" forState:UIControlStateNormal];
        [jumpButton setBackgroundColor:[UIColor redColor]];
        [jumpButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:jumpButton];
    }
    if (self.navigationController.childViewControllers.count > 1) {
        UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 60)];
        [popButton setTitle:@"pop" forState:UIControlStateNormal];
        [popButton setBackgroundColor:[UIColor greenColor]];
        [popButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:popButton];
    }
}

- (void)push {
    NSString *vcName = [self.stepArray.firstObject stringByAppendingString:@"ViewController"];
    ZZBaseViewController *vc = [NSClassFromString(vcName) new];
    if (self.stepArray.count > 1) {
        [vc setStepArray:[self.stepArray subarrayWithRange:NSMakeRange(1, self.stepArray.count - 1)]];
    }
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
