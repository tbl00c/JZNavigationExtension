//
//  ZZBaseViewController.h
//  JZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/23.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZNavigationExtension.h"

@interface ZZBaseViewController : UIViewController

@property (nonatomic, strong) NSArray *stepArray;

- (void)push;

@end
