//
//  UIButton+FRImageStyle.h
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FRButtonImageStyle) {
    
    FRButtonImageStyleLeft,    // image 左，title 右，系统默认情况
    FRButtonImageStyleRight,   // image 右
    FRButtonImageStyleTop,     // image 上
    FRButtonImageStyleBottom,  // image 下
};

@interface UIButton (FRImageStyle)

/**
 必须在设置图片和文本之后调用，否则无法获取大小 image.size
 返回需要的最小size
 */
- (CGSize)setImageEdgeInsetsStyle:(FRButtonImageStyle)style space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
