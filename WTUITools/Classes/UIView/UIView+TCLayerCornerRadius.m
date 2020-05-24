//
//  UIView+TCLayerCornerRadius.m
//  tctdlive
//
//  Created by 冲 on 2019/5/30.
//  Copyright © 2019年 cat. All rights reserved.
//

#import "UIView+TCLayerCornerRadius.h"

@implementation UIView (TCLayerCornerRadius)


/**
 * setCornerRadius   给view设置圆角
 * @param value      圆角大小
 * @param rectCorner 圆角位置
 **/
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner{
    
    [self layoutIfNeeded];//这句代码很重要，不能忘了
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    
}

+ (UIView *)viewWithFilletCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity
{
    UIView *view = [[UIView alloc] init];
    // 添加圆角
    view.layer.cornerRadius = cornerRadius;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor.CGColor;
    
    view.layer.shadowColor = shadowColor.CGColor;
    view.layer.shadowOpacity = shadowOpacity;
    view.layer.shadowRadius = shadowRadius;
    view.layer.shadowOffset = shadowOffset;
    
    return view;
}

- (void)filletCornerRadius:(CGFloat)cornerRadius
               shadowColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowOffset
              shadowRadius:(CGFloat)shadowRadius
             shadowOpacity:(CGFloat)shadowOpacity
                 fillColor:(UIColor *)fillColor
               rectCorners:(UIRectCorner)rectCorner
{
    CAShapeLayer *subLayer=[CAShapeLayer layer];
    CGRect fixframe = self.bounds;
    subLayer.path = [[UIBezierPath bezierPathWithRoundedRect:fixframe byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)] CGPath];
    subLayer.backgroundColor = [UIColor clearColor].CGColor;
    subLayer.fillColor = fillColor.CGColor;
    subLayer.frame= fixframe;
    subLayer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    subLayer.shadowOffset = shadowOffset;
    subLayer.shadowOpacity = shadowOpacity;
    subLayer.shadowRadius = shadowRadius;
    [self.layer insertSublayer:subLayer below:self.layer];
}

@end
