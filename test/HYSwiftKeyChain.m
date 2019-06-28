//
//  HYSwiftKeyChain.m
//  test
//
//  Created by rr wanggy on 2019/6/4.
//  Copyright © 2019 rr wanggy. All rights reserved.
//

#import "HYSwiftKeyChain.h"

@implementation HYSwiftKeyChain

+ (NSString *)passwordForService:(nonnull NSString *)service account:(nonnull NSString *)account {
    //生成一个查询用的 可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:4];
    [dict setObject:service forKey:(__bridge id)kSecAttrService];    //输入service
    [dict setObject:account forKey:(__bridge id)kSecAttrAccount];  //输入account
    [dict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass]; //表明为一般密码可能是证书或者其他东西
    [dict setObject:@YES forKey:(__bridge id)kSecReturnData];     //返回Data

    //查询
    OSStatus status = -1;
    CFTypeRef result = NULL;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)dict,&result);//核心API 查找是否匹配 和返回密码！
    if (status != errSecSuccess) { //判断状态
        return nil;
    }
    
    //返回数据
    NSString *password = [[NSString alloc] initWithData:(__bridge_transfer NSData *)result encoding:NSUTF8StringEncoding];//转换成string
    return password;
}

+ (BOOL)addItemWithService:(NSString *)service account:(NSString *)account password:(NSString *)password {
    //先查查是否已经存在
    //构造一个操作字典用于查询
    NSMutableDictionary *searchDict = [[NSMutableDictionary alloc]initWithCapacity:4];
    [searchDict setObject:service forKey:(__bridge id)kSecAttrService];                         //标签service
    [searchDict setObject:account forKey:(__bridge id)kSecAttrAccount];                         //标签account
    [searchDict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];//表明存储的是一个密码
    [searchDict setObject:(__bridge id)(kSecAttrSynchronizableAny) forKey:(__bridge id)(kSecAttrSynchronizable)];
    
    OSStatus status = -1;
    CFTypeRef result = NULL;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)searchDict, &result);
    if (status == errSecItemNotFound) {                                              //没有找到则添加
        NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];    //把password 转换为 NSData
        [searchDict setObject:passwordData forKey:(__bridge id)kSecValueData];       //添加密码
        status = SecItemAdd((__bridge CFDictionaryRef)searchDict, NULL);             //!!!!!关键的添加API
    } else if (status == errSecSuccess){                                              //成功找到，说明钥匙已经存在则进行更新
        NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];    //把password 转换为 NSData
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:passwordData forKey:(__bridge id)kSecValueData];             //添加密码
        status = SecItemUpdate((__bridge CFDictionaryRef)searchDict, (__bridge CFDictionaryRef)dict);//!!!!关键的更新API
    }
    return (status == errSecSuccess);
}

+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account {
    //构造一个操作字典用于查询
    NSMutableDictionary *searchDict = [[NSMutableDictionary alloc]initWithCapacity:4];
    [searchDict setObject:serviceName forKey:(__bridge id)kSecAttrService];                         //标签service
    [searchDict setObject:account forKey:(__bridge id)kSecAttrAccount];                         //标签account
    [searchDict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];//表明存储的是一个密码
    [searchDict setObject:(__bridge id)(kSecAttrSynchronizableAny) forKey:(__bridge id)(kSecAttrSynchronizable)];
    
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)searchDict);
    return (status == errSecSuccess);
}

@end
