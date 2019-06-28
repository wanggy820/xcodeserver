//
//  HYSwiftKeyChain.h
//  test
//
//  Created by rr wanggy on 2019/6/4.
//  Copyright © 2019 rr wanggy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYSwiftKeyChain : NSObject

+ (NSString *)passwordForService:(nonnull NSString *)service account:(nonnull NSString *)account;
+ (BOOL)addItemWithService:(NSString *)service account:(NSString *)account password:(NSString *)password;
+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account;

@end

NS_ASSUME_NONNULL_END
