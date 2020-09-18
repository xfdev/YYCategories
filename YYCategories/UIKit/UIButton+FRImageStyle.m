//
//  UIButton+FRImageStyle.m
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import "UIButton+FRImageStyle.h"

@implementation UIButton (FRImageStyle)

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

@end
