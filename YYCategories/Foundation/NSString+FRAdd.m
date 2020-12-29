//
//  NSString+FRAdd.m
//  FRHere
//
//  Created by sonny on 2020/6/13.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import "NSString+FRAdd.h"

@implementation NSString (FRAdd)

- (BOOL)isEmail {
    NSString *emailReg = @"^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$";
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    BOOL emailResult = [regextest evaluateWithObject:self];
    
    return emailResult;
}

/// https://urlregex.com/
- (BOOL)isURL {
    NSString *stringReg = @"^(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringReg];
    BOOL result = [predicate evaluateWithObject:self];
    
    return result;
}
- (BOOL)isPhoneNumber {
    //    电信号段: 133,149,153,170,173,177,180,181,189,199
    //    联通号段: 130,131,132,145,155,156,166,170,171,175,176,185,186
    //    移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188,198
    //    虚拟运营商:170[1700/1701/1702(电信)、1703/1705/1706(移动)、1704/1707/1708/1709(联通)]、171（联通）
    // 2018.03.29 添加 16[6], 19[89] 号段
    NSString *mobileReg = @"^1(3|4|5|6|7|8|9)\\d{9}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileReg];
    
    return [regextestmobile evaluateWithObject:self];
}
- (BOOL)isIP {
    NSString *URLReg = @"(https?://)((2[0-4]\\d|25[0-5]|[01]?\\d\\d?).){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)(:\\d+)?";
    NSPredicate *regextestURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URLReg];
    BOOL URLResult = [regextestURL evaluateWithObject:self];
    
    // 上面的正则表达式有问题，不能排除中文的 "／" 和 "："，这里手动查询。
    BOOL otherResult = !([self containsString:@"："] || [self containsString:@"／"]);
    
    return URLResult && otherResult;
}
- (BOOL)isSecondGenerationIDCard {
    
    if ([self length] != 18) {
        return NO;
    }
    
    //验证身份证号码出身月日
    NSString *m = [self substringWithRange:NSMakeRange(10, 2)];
    NSString *d = [self substringWithRange:NSMakeRange(12, 2)];
    
    if ([m intValue] > 12 || [d intValue] > 31) {
        return NO;
    }
    
    //加权因子 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2
    int w[17] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
    int sum = 0;
    for (int i = 0; i < 17; i++) {
        int a =  [self characterAtIndex:i] - '0';
        sum += a * w[i];
    }
    int mod = sum % 11;
    
    BOOL isValid = NO;
    unichar lastC = [self characterAtIndex:17];
    // mod   : 0 1 2 3 4 5 6 7 8 9 10
    // 校验码 : 1 0 X 9 8 7 6 5 4 3 2
    switch (mod) {
        case 0:
            isValid = (lastC == '1');
            break;
        case 1:
            isValid = (lastC == '0');
            break;
        case 2:
            isValid = (lastC == 'X');
            if (!isValid) {
                isValid = (lastC == 'x');
            }
            break;
        case 3:
            isValid = (lastC == '9');
            break;
        case 4:
            isValid = (lastC == '8');
            break;
        case 5:
            isValid = (lastC == '7');
            break;
        case 6:
            isValid = (lastC == '6');
            break;
        case 7:
            isValid = (lastC == '5');
            break;
        case 8:
            isValid = (lastC == '4');
            break;
        case 9:
            isValid = (lastC == '3');
            break;
        case 10:
            isValid = (lastC == '2');
            break;
        default:
            break;
    }
    return isValid;
}



- (UIImage *)image {
    if (!self || ![self isKindOfClass:NSString.class] || !self.length) {
        return nil;
    }
    return [UIImage imageNamed:self];
}
- (UIImage *)imageAlwaysOriginal {
    return [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UIImage *)imageAlwaysTemplate {
    return [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (NSURL *)url {
    if (!self || ![self isKindOfClass:NSString.class] || !self.length) {
        return nil;
    }
    return [NSURL URLWithString:self];
}


@end
