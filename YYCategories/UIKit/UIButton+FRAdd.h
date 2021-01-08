//
//  UIButton+FRAdd.h
//  YYCategories
//
//  Created by sonny on 2021/1/8.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FRButtonImageStyle) {
    
    FRButtonImageStyleLeft,    // image 左，title 右，系统默认情况
    FRButtonImageStyleRight,   // image 右
    FRButtonImageStyleTop,     // image 上
    FRButtonImageStyleBottom,  // image 下
};


@interface UIButton (FRAdd)


/// 设置按钮的图片样式，必须在设置图片和文本之后调用，否则无法获取大小 image.size
/// @param style 图片位于文字的方向
/// @param space 图片和文字距离
/// @return size 返回需要的最小size
- (CGSize)setImageEdgeInsetsStyle:(FRButtonImageStyle)style space:(CGFloat)space;


#pragma mark - 按钮倒计时
- (void)setCountDownDuration:(NSTimeInterval)duration durationFormat:(NSString *)format endTitle:(NSString *)title;
- (void)startCountDown;
- (void)stopCountDown;

@property (nonatomic, assign) NSTimeInterval originalDuration; // 原始倒计时时间 60s.
@property (nonatomic, assign) NSTimeInterval duration; // 倒计时时间，过程中用到的.
@property (nonatomic, copy) NSString *durationFormat; // 倒计时中的title Format @"还有%ld秒".
@property (nonatomic, copy) NSString *endTitle; // 结束的title.



@end

NS_ASSUME_NONNULL_END
