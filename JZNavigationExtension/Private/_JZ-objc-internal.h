//
//  _JZ-objc-internal.h
//
//  Created by Jazys on 3/11/16.
//  Copyright © 2016 Jazys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UINavigationController+JZPrivate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wnullability-completeness"

@interface UIViewController (_JZExtension)

- (CGFloat)jz_navigationBarBackgroundAlphaWithNavigationController:(UINavigationController *)navigationController;
- (UIColor *)jz_navigationBarTintColorWithNavigationController:(UINavigationController *)navigationController;
- (BOOL)jz_wantsNavigationBarVisibleWithNavigationController:(UINavigationController *)navigationController;

@end

@interface _JZValue : NSObject

+ (_JZValue *)valueWithWeakObject:(id)anObject;
@property (weak, readonly) id weakObjectValue;

@end


@protocol JZExtensionBarProtocol <NSObject>

@property (nonatomic, assign) CGSize jz_size;

- (UIView * _Nullable)jz_backgroundView;
- (CGSize)jz_sizeThatFits:(CGSize)size;

@end

@interface UINavigationBar (JZExtension) <JZExtensionBarProtocol>

@end

@interface UIToolbar (JZExtension) <JZExtensionBarProtocol>

@end

#pragma clang diagnostic pop
