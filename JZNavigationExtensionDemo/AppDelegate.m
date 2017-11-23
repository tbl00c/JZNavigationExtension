//
//  AppDelegate.m
//  navbarTest
//
//  Created by 李伯坤 on 2017/11/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "AppDelegate.h"
#import <TLTabBarController.h>
#import "ZZHomeViewController.h"
#import "ZZCateViewController.h"
#import "ZZPublishViewController.h"
#import "ZZMessageViewController.h"
#import "ZZMineViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    TLTabBarController *tabBarVC = [[TLTabBarController alloc] init];
    [tabBarVC.tabBar setPlusButtonImageOffset:10];
    
    [tabBarVC addChildViewController:[[UINavigationController alloc] initWithRootViewController:[ZZHomeViewController new]]];
    [tabBarVC addChildViewController:[[UINavigationController alloc] initWithRootViewController:[ZZCateViewController new]]];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:nil
                                                       image:[[UIImage imageNamed:@"tab_willsell"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                               selectedImage:[[UIImage imageNamed:@"tab_willsell"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarVC addPlusItemWithSystemTabBarItem:item actionBlock:^{
        UIViewController *vc = [[UINavigationController alloc] initWithRootViewController:[ZZPublishViewController new]];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    }];
    
    [tabBarVC addChildViewController:[[UINavigationController alloc] initWithRootViewController:[ZZMessageViewController new]]];
    [tabBarVC addChildViewController:[[UINavigationController alloc] initWithRootViewController:[ZZMineViewController new]]];

    [self.window addSubview:tabBarVC.view];
    [self.window setRootViewController:tabBarVC];

    return YES;
}


@end
