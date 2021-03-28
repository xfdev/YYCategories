//
//  NSDate+FRAdd.h
//  YYCategories
//
//  Created by sonny on 2021/3/28.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (FRAdd)

// 日期的比较，翻译自：https://www.deepl.com/zh/translator#zh/en/%E5%A4%A7%E4%BA%8E%E7%AD%89%E4%BA%8E
/// > (大于，类似与 6 > 5 ，明天 > 今天，将来 > 现在 > 过去)
- (BOOL)isGreaterThan:(NSDate *)otherDate;
/// >= (大于等于)
- (BOOL)isGreaterThanOrEqualTo:(NSDate *)otherDate;
/// < (小于)，(类似与 5 < 6 ，今天 < 明天，过去 < 现在 < 将来)
- (BOOL)isLessThan:(NSDate *)otherDate;
/// <= (小于等于)
- (BOOL)isLessThanOrEqualTo:(NSDate *)otherDate;

/// 同一天，年月日相等，忽略具体时间。
- (BOOL)isSameDay:(NSDate *)otherDate;





@end

NS_ASSUME_NONNULL_END
