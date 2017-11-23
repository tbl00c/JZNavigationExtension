//
//  UINavigationController+iOS11Fix.m
//  JZNavigationExtensionDemo
//
//  Created by 李伯坤 on 2017/11/23.
//  Copyright © 2017年 Jazys. All rights reserved.
//

#import "UINavigationController+iOS11Fix.h"
#import <objc/runtime.h>

@implementation UINavigationController (iOS11Fix)

__attribute__((constructor)) static void JZ_Inject(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        void (^jz_method_swizzling)(Class, SEL, SEL) = ^(Class class, SEL originalSelector, SEL swizzledSelector) {
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        };
        
        jz_method_swizzling([UINavigationController class], @selector(pushViewController:animated:), @selector(jz_pushViewController:animated:));
    });
}

- (void)jz_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self jz_pushViewController:viewController animated:animated];
    
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

@end
