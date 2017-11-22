//
//  _JZNavigationControllerDelegate.m
//  
//
//  Created by Jazys on 8/29/16.
//  Copyright © 2016 Jazys. All rights reserved.
//

#import "_JZNavigationDelegating.h"
#import "_JZ-objc-internal.h"
#import "UIViewController+JZExtension.h"
#import "UINavigationController+JZExtension.h"

@implementation _JZNavigationDelegating

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"will show %@", [viewController description]);
    
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = navigationController.topViewController.transitionCoordinator;
    
    [navigationController setNavigationBarHidden:![viewController jz_wantsNavigationBarVisibleWithNavigationController:navigationController] animated:animated];
    void (^animateAlongsideTransition)(id <UIViewControllerTransitionCoordinatorContext>) = ^(id<UIViewControllerTransitionCoordinatorContext> context) {
        navigationController.jz_navigationBarTintColor = [viewController jz_navigationBarTintColorWithNavigationController:navigationController];
        navigationController.jz_navigationBarBackgroundAlpha = [viewController jz_navigationBarBackgroundAlphaWithNavigationController:navigationController];
    };

    [transitionCoordinator animateAlongsideTransition:animateAlongsideTransition completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    
        if (context.initiallyInteractive) {
            UIViewController *adjustViewController = navigationController.visibleViewController;
            if (context.isCancelled) {
                UIColor *newNavigationBarColor = [adjustViewController jz_navigationBarTintColorWithNavigationController:navigationController];
                navigationController.jz_navigationBarTintColor = newNavigationBarColor;
                navigationController.jz_navigationBarBackgroundAlpha = [adjustViewController jz_navigationBarBackgroundAlphaWithNavigationController:navigationController];
            }
            else {
                [navigationController setNavigationBarHidden:![adjustViewController jz_wantsNavigationBarVisibleWithNavigationController:navigationController] animated:animated];
            }
            
            if (navigationController.jz_interactivePopGestureRecognizerCompletion){
                navigationController.jz_interactivePopGestureRecognizerCompletion(navigationController, !context.isCancelled);
            }
        }
     
        navigationController.jz_navigationTransitionCompletion = NULL;
        navigationController.jz_operation = UINavigationControllerOperationNone;
        UIViewController *viewController = navigationController.visibleViewController;
        
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
