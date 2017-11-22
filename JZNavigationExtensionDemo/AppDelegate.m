//
//  AppDelegate.m
//  navbarTest
//
//  Created by 李伯坤 on 2017/11/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "AppDelegate.h"
#import "AViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    AViewController *vc = [[AViewController alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window addSubview:navC.view];
    [self.window setRootViewController:navC];

    return YES;
}


@end
