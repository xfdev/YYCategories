//
//  NSDate+FRAdd.m
//  YYCategories
//
//  Created by sonny on 2021/3/28.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import "NSDate+FRAdd.h"
#import "NSDate+YYAdd.h"


@implementation NSDate (FRAdd)

/// > (大于对比的日期)
- (BOOL)isGreaterThan:(NSDate *)otherDate {
    return ([self compare:otherDate] == NSOrderedDescending);
}
/// >= (大于等于)
- (BOOL)isGreaterThanOrEqualTo:(NSDate *)otherDate {
    return ([self compare:otherDate] != NSOrderedAscending);
}
/// < (小于)
- (BOOL)isLessThan:(NSDate *)otherDate {
    return ([self compare:otherDate] == NSOrderedAscending);
}
/// <= (小于等于)
- (BOOL)isLessThanOrEqualTo:(NSDate *)otherDate {
    return ([self compare:otherDate] != NSOrderedDescending);
}

/// 同一天，年月日相等，忽略具体时间。
- (BOOL)isSameDay:(NSDate *)otherDate {
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:otherDate];
    return (components1.year == components2.year && components1.month == components2.month && components1.day == components2.day);
}





@end
