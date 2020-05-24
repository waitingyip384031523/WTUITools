//
//  UIView+TCLayerCornerRadius.h
//  tctdlive
//
//  Created by 冲 on 2019/5/30.
//  Copyright © 2019年 cat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TCLayerCornerRadius)

- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner;

/**
 View切圆角和添加阴影
 
 @param cornerRadius 圆角半径
 @param shadowOffset 阴影偏移
 @return 带圆角和阴影的View
 */
+ (UIView *)viewWithFilletCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity;

- (void)filletCornerRadius:(CGFloat)cornerRadius
               shadowColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowOffset
              shadowRadius:(CGFloat)shadowRadius
             shadowOpacity:(CGFloat)shadowOpacity
                 fillColor:(UIColor *)fillColor
               rectCorners:(UIRectCorner)rectCorner;
@end

NS_ASSUME_NONNULL_END
