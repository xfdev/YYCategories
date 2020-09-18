//
//  NSNotificationCenter+FRAdd.m
//  FRHere
//
//  Created by sonny on 2020/6/13.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import "NSNotificationCenter+FRAdd.h"


@implementation NSNotificationCenter (FRAdd)

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:nil];
}

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];
}

+ (void)postNotificationName:(NSNotificationName)aName {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:aName object:nil];
    });
}

+ (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
    });
}

+ (void)removeObserver:(id)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

@end
