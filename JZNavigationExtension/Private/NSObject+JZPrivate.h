//
//  NSObject+JZPrivate.h
//  AFNetworking
//
//  Created by 李伯坤 on 2017/11/24.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)(void);

@interface NSObject (JZPrivate)

- (void)jz_addDeallocTask:(DeallocBlock)task forTarget:(id)target key:(NSString *)key;

- (void)jz_removeDeallocTaskForTarget:(id)target key:(NSString *)key;

@end
