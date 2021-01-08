//
//  UIButton+FRAdd.m
//  YYCategories
//
//  Created by sonny on 2021/1/8.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import "UIButton+FRAdd.h"
#import "YYCategoriesMacro.h"
#import <objc/runtime.h>

@implementation UIButton (FRAdd)

/// 设置按钮的图片样式，必须在设置图片和文本之后调用，否则无法获取大小 image.size
/// @param style 图片位于文字的方向
/// @param space 图片和文字距离
/// @return size 返回需要的最小size
- (CGSize)setImageEdgeInsetsStyle:(FRButtonImageStyle)style space:(CGFloat)space {
    
    CGFloat s = space / 2.0;
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    //    CGFloat titleWidth = titleSize/2 + s;
    
    
    switch (style) {
        case FRButtonImageStyleLeft:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -s, 0, s);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, s, 0, -s);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, -s, 0, -s);
            return CGSizeMake(imageSize.width + space + titleSize.width, MAX(imageSize.height, titleSize.height));
            break;
        case FRButtonImageStyleRight:
            
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + s, 0, -(titleSize.width + s));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width + s), 0, imageSize.width + s);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, -s, 0, -s);
            return CGSizeMake(imageSize.width + space + titleSize.width, MAX(imageSize.height, titleSize.height));
            break;
        case FRButtonImageStyleTop: {
            
            // UIEdgeInsetsMake 的负值都是往外扩展，正值往内缩小
            // fabs(double) 取绝对值
            CGFloat edgeOffset = fabs(titleSize.height - imageSize.height)/2.f;
            self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, -imageSize.width/2, edgeOffset, -imageSize.width/2);
            
            // 上下排版时有问题，文字会被压缩，因为按照本来的也会显示不全，需要优化
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height/2 + s), titleSize.width/2, titleSize.height/2 + s, -titleSize.width/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height/2 + s, -imageSize.width/2, -(imageSize.height/2 + s), imageSize.width/2);
            
            return CGSizeMake(MAX(imageSize.width, titleSize.width), imageSize.height + space + titleSize.height);
        }
            break;
        case FRButtonImageStyleBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake(titleSize.height/2 + s, titleSize.width/2, -(titleSize.height/2 + s), -titleSize.width/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height/2 + s), -imageSize.width/2, imageSize.height/2 + s, imageSize.width/2);
            
            CGFloat edgeOffset = fabs(titleSize.height - imageSize.height)/2.f;
            self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
            //            self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            
            return CGSizeMake(MAX(imageSize.width, titleSize.width), imageSize.height + space + titleSize.height);
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - 倒计时
// 不支持基本类型
//YYSYNTH_DYNAMIC_PROPERTY_OBJECT(duration, setDuration, ASSIGN, NSTimeInterval);

- (void)setCountDownDuration:(NSTimeInterval)duration durationFormat:(NSString *)format endTitle:(NSString *)title {
    self.originalDuration = duration;
    self.durationFormat = format;
    self.endTitle = title;
}
- (void)startCountDown {
    
    self.enabled = NO;
    // 开始后直接设置倒计时标题
    self.duration = self.originalDuration;// 重置倒计时时间
    NSString *countDownTitle = [NSString stringWithFormat:self.durationFormat, (long)self.originalDuration];
    [self setTitle:countDownTitle forState:UIControlStateDisabled];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        self.duration--;
        
        if (self.duration <= 0) {
            // 倒计时结束
            [timer invalidate];
            timer = nil;
            
            self.enabled = YES;// 普通状态
            [self setTitle:self.endTitle forState:UIControlStateNormal];
            
        } else {
            // 倒计时中
            NSString *countDownTitle = [NSString stringWithFormat:self.durationFormat, (long)self.duration];
            [self setTitle:countDownTitle forState:UIControlStateDisabled];
        }
    }];
}
- (void)stopCountDown {
    // 中途结束倒计时，可能还未开始？
    self.duration = 0.0;
    self.enabled = YES;// 普通状态
    [self setTitle:self.endTitle forState:UIControlStateNormal];
}

/// @property (nonatomic, assign) NSTimeInterval originalDuration; // 原始倒计时时间 60s.
- (void)setOriginalDuration:(NSTimeInterval)originalDuration {
    objc_setAssociatedObject(self, _cmd, @(originalDuration), OBJC_ASSOCIATION_ASSIGN);
}
- (NSTimeInterval)originalDuration {
    return [objc_getAssociatedObject(self, @selector(setOriginalDuration:)) doubleValue];
}
/// @property (nonatomic, assign) NSTimeInterval duration; // 倒计时时间.
- (void)setDuration:(NSTimeInterval)duration {
    objc_setAssociatedObject(self, _cmd, @(duration), OBJC_ASSOCIATION_ASSIGN);
}
- (NSTimeInterval)duration {
    return [objc_getAssociatedObject(self, @selector(setDuration:)) doubleValue];
}
/// @property (nonatomic, copy) NSString *durationFormat; // 倒计时中的title Format @"还有%ld秒".
YYSYNTH_DYNAMIC_PROPERTY_OBJECT(durationFormat, setDurationFormat, COPY_NONATOMIC, NSString *);
/// @property (nonatomic, copy) NSString *endTitle; // 结束的title.
YYSYNTH_DYNAMIC_PROPERTY_OBJECT(endTitle, setEndTitle, COPY_NONATOMIC, NSString *);



@end
