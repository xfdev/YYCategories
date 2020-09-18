//
//  NSNotificationCenter+FRAdd.h
//  FRHere
//
//  Created by sonny on 2020/6/13.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSNotificationCenter (FRAdd)

/// object 参数为 nil
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName;

/**
 Object registering as an observer...
 */
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

/// 其他参数为 nil
+ (void)postNotificationName:(NSNotificationName)aName;

/**
 The object posting the notification...
 */
+ (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

+ (void)removeObserver:(id)observer;


@end

NS_ASSUME_NONNULL_END
