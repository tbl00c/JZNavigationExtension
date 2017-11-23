//
//  _JZNavigationControllerDelegate.m
//  
//
//  Created by Jazys on 8/29/16.
//  Copyright © 2016 Jazys. All rights reserved.
//

#import "_JZNavigationDelegating.h"
#import "UIViewController+JZExtension.h"
#import "UINavigationController+JZExtension.h"
#import "UINavigationController+JZPrivate.h"
#import "_JZValue.h"
#import <objc/runtime.h>

@implementation _JZNavigationDelegating

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    BOOL wantsNavbarVisible = viewController.jz_wantsNavigationBarVisible;
    UIColor *tintColor = viewController.jz_navigationBarTintColor;
    CGFloat bgAlpha = viewController.jz_navigationBarBackgroundAlpha;
    
    [navigationController setNavigationBarHidden:!wantsNavbarVisible animated:animated];
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = navigationController.topViewController.transitionCoordinator;
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if (wantsNavbarVisible) {
            if (tintColor) {
                navigationController.jz_navigationBarTintColor = tintColor;
            }
            navigationController.jz_navigationBarBackgroundAlpha = bgAlpha;
        }
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if (context.initiallyInteractive) {
            UIViewController *adjustViewController = navigationController.visibleViewController;
            BOOL adjust_wantsNavbarVisible = adjustViewController.jz_wantsNavigationBarVisible;
            UIColor *adjust_tintColor = adjustViewController.jz_navigationBarTintColor;
            CGFloat adjust_bgAlpha = adjustViewController.jz_navigationBarBackgroundAlpha;
            if (context.isCancelled) {
                if (adjust_wantsNavbarVisible) {
                    if (adjust_tintColor) {
                        navigationController.jz_navigationBarTintColor = adjust_tintColor;
                    }
                    navigationController.jz_navigationBarBackgroundAlpha = adjust_bgAlpha;
                }
            }
            else {
                [navigationController setNavigationBarHidden:!adjust_wantsNavbarVisible animated:animated];
            }
            
            if (navigationController.jz_interactivePopGestureRecognizerCompletion){
                navigationController.jz_interactivePopGestureRecognizerCompletion(navigationController, !context.isCancelled);
            }
        }
     
        navigationController.jz_navigationTransitionCompletion = NULL;
        navigationController.jz_operation = UINavigationControllerOperationNone;
        
        if (navigationController.jz_navigationTransitionCompletion) {
            navigationController.jz_navigationTransitionCompletion(navigationController, true);
        }
    }];
    
    if (![navigationController.delegate isEqual:navigationController.jz_navigationDelegate]) {
        Class superClass = class_getSuperclass(object_getClass(self));
        void (*superIMP)(id _Nonnull, SEL _Nonnull, UINavigationController *, UIViewController *, BOOL) = (void *)class_getMethodImplementation(superClass, _cmd);
        superIMP(self, _cmd, navigationController, viewController, animated);
    }
}

#pragma mark - gestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    UINavigationController *navigationController = self.navigationController;
    return navigationController.viewControllers.count != 1 && ![navigationController transitionCoordinator] && !CGRectContainsPoint(navigationController.navigationBar.frame, [touch locationInView:gestureRecognizer.view]);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    UINavigationController *navigationController = self.navigationController;
    if (!navigationController.jz_fullScreenInteractivePopGestureEnabled) {
        return true;
    }
    CGPoint locationInView = [gestureRecognizer locationInView:gestureRecognizer.view];
    return locationInView.x < 30.0f;
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint velocityInview = [gestureRecognizer velocityInView:gestureRecognizer.view];
    return velocityInview.x >= 0.0f;
}

@end
