//
//  NSDictionary+SafeExpectations.h
//  NSObject-SafeExpectationsTests
//
//  Created by Jorge Bernal on 2/6/13.
//
//

#import <Foundation/Foundation.h>

/**
 Additions to NSDictionary
 */
@interface NSDictionary (SafeExpectations)

/**
 Returns a NSString value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting string. If the result is not a NSString and can't converted to one, it returns nil
 */
//- (NSString *)stringForKey:(id)key;// 最近（2016.05.30）出现这个方法没有被调用的情况，取出后直接为nil，原因未找到，猜测是和修改配置文件有关或和系统 NSUserDefaults,NSUbiquitousKeyValueStore 方法名重复，错误调用系统方法。
- (NSString *)safeStringForKey:(id)key;
/**
 返回一个 NSInteger 的值（指定 key）
 
 这里是用 safeStringForKey: 方法通过 integerValue 转换得到
 如果得到的字符串为 nil，则返回 0
 */
- (NSInteger)safeIntegerForKey:(id)key;

/**
 Returns a NSNumber value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting number. If the result is not a NSNumber and can't converted to one, it returns nil
 */
- (NSNumber *)safeNumberForKey:(id)key;

/**
 Returns a NSArray value for the specified key.
 
 @param key The key for which to return the corresponding value
 @returns the resulting array. If the result is not a NSArray, it returns nil
 */
- (NSArray *)safeArrayForKey:(id)key;
/**
 Returns a NSDictionary value for the specified key. 
 
 @param key The key for which to return the corresponding value
 @returns the resulting dictionary. If the result is not a NSDictionary, it returns nil
 */
- (NSDictionary *)safeDictionaryForKey:(id)key;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property (with one or more relationships); for example “department.name” or “department.manager.lastName”
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid, it returns nil
 */
- (id)objectForKeyPath:(NSString *)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSString or can't be converted to one, it returns nil
 */
//- (NSString *)stringForKeyPath:(id)keyPath;
- (NSString *)safeStringForKeyPath:(id)keyPath;
/**
 Returns an 数字 object for the specified keyPath
 
 @param keyPath A key path of the form relationship.property, see objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSInteger or can't be converted to one, it returns 0
 根据路径取值，如果1.找不着路径 or 2.结果不是 NSInteger 类型 or 3.不能转换，则返回 0
 */
- (NSInteger)safeIntegerForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSNumber or can't be converted to one, it returns nil
 */
- (NSNumber *)numberForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSArray, it returns nil
 */
- (NSArray *)arrayForKeyPath:(id)keyPath;

/**
 Returns an object for the specified keyPath

 @param keyPath A key path of the form relationship.property, see objectForKeyPath:
 @returns The value for the derived property identified by keyPath. If the keyPath is not valid or the result is not a NSDictionary, it returns nil
 */
- (NSDictionary *)dictionaryForKeyPath:(id)keyPath;


@end
