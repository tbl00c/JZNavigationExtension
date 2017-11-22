//
//  _JZ-objc-internal.m
//  
//
//  Created by Jazys on 04/11/2017.
//  Copyright © 2017 Jazys. All rights reserved.
//

#import "_JZ-objc-internal.h"

#define JZExtensionBarImplementation \
- (CGSize)jz_sizeThatFits:(CGSize)size { \
    CGSize newSize = [self jz_sizeThatFits:size]; \
    return CGSizeMake(self.jz_size.width == 0.f ? newSize.width : self.jz_size.width, self.jz_size.height == 0.f ? newSize.height : self.jz_size.height); \
} \
- (void)setJz_size:(CGSize)size { \
    objc_setAssociatedObject(self, @selector(jz_size), [NSValue valueWithCGSize:size], OBJC_ASSOCIATION_RETAIN_NONATOMIC); \
    [self sizeToFit]; \
} \
- (CGSize)jz_size { \
    return [objc_getAssociatedObject(self, _cmd) CGSizeValue]; \
}

@implementation _JZValue
@synthesize weakObjectValue = _weakObjectValue;

+ (_JZValue *)valueWithWeakObject:(id)anObject {
    _JZValue *value = [[self alloc] init];
    value->_weakObjectValue = anObject;
    return value;
}

@end

@implementation UINavigationBar (JZExtension)

JZExtensionBarImplementation
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if ([[self jz_backgroundView] alpha] < 1.0f) {
        return CGRectContainsPoint(CGRectMake(0, self.bounds.size.height - 44.f, self.bounds.size.width, 44.f), point);
    } else {
        return [super pointInside:point withEvent:event];
    }
}

- (UIView *)jz_backgroundView {
    UIView *bgView = [self valueForKey:@"_backgroundView"];
    if ([bgView respondsToSelector:NSSelectorFromString(@"_backgroundEffectView")]) {
        bgView = [bgView valueForKey:@"_backgroundEffectView"];
    }
    return bgView;
}

@end

@implementation UIToolbar (JZExtension)

JZExtensionBarImplementation

- (UIView *)jz_backgroundView {
    return [self valueForKey:@"_backgroundView"];
}

@end
