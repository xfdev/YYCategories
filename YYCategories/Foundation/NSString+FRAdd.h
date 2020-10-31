//
//  NSString+FRAdd.h
//  FRHere
//
//  Created by sonny on 2020/6/13.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FRAdd)

// 格式校验
#warning 使用 NSDataDetector 来优化
- (BOOL)isEmail;
- (BOOL)isURL;
- (BOOL)isPhoneNumber;
- (BOOL)isIP;
- (BOOL)isSecondGenerationIDCard;// 第二代身份证校验
// 读取资源
- (UIImage *)image;
- (UIImage *)imageAlwaysOriginal;
- (UIImage *)imageAlwaysTemplate;

// 格式转换
- (NSURL *)url;


@end

NS_ASSUME_NONNULL_END
