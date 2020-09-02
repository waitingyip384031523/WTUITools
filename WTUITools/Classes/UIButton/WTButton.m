//
//  YHButton.m
//  TempButton
//
//  Created by Wt.Yip on 2017/7/31.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTButton.h"
#import "UIButton+EnlargeTouchAre.h"
#import <objc/runtime.h>

@interface WTButton()

@end

@implementation WTButton

+ (instancetype)buttonWithType:(UIButtonType)type
              andImagePosition:(WTButtonImagePosition)postion
                     andMargin:(CGFloat)margin
{
    return [WTButton buttonWithType:type andImagePosition:postion andMargin:margin inset:UIEdgeInsetsZero];
}

+ (instancetype)buttonWithType:(UIButtonType)type andImagePosition:(WTButtonImagePosition)postion andMargin:(CGFloat)margin inset:(UIEdgeInsets)inset
{
    WTButton *button = [WTButton buttonWithType:type];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.position = postion;
    button.margin = margin;
    button.edgeInset = inset;
    return button;
}

- (instancetype)initWithImagePosition:(WTButtonImagePosition)position andMargin:(CGFloat)margin
{
    return [self initWithImagePosition:position andMargin:margin inset:UIEdgeInsetsZero];
}

- (instancetype)initWithImagePosition:(WTButtonImagePosition)position andMargin:(CGFloat)margin inset:(UIEdgeInsets)inset
{
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.position = position;
        self.margin = margin;
        self.edgeInset = inset;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize imageSize = self.imageView.frame.size;
    CGSize labelSize = self.titleLabel.frame.size;
    CGRect imageRect = self.imageView.frame;
    CGRect labelRect = self.titleLabel.frame;
    CGFloat commonTop = (self.frame.size.height - imageSize.height - labelSize.height - self.edgeInset.top - self.edgeInset.bottom - self.margin) / 2;
    CGFloat commonLeft = (self.frame.size.width - imageSize.width - labelSize.width - self.edgeInset.left - self.edgeInset.right - self.margin) / 2;
    switch (self.position) {
        case WTButtonImageTop:
        {
            imageRect.origin = CGPointMake((self.frame.size.width - imageSize.width) / 2, commonTop);
            labelRect.origin = CGPointMake(0, CGRectGetMaxY(imageRect) + self.margin);
            labelRect.size = CGSizeMake(self.frame.size.width, labelSize.height);
            [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
            break;
        case WTButtonImageLeft:
        {
            imageRect.origin = CGPointMake(commonLeft, imageRect.origin.y);
            labelRect.origin = CGPointMake(CGRectGetMaxX(imageRect) + self.margin, labelRect.origin.y);
            if (!labelRect.size.width) {
                imageRect.origin = CGPointMake(0, imageRect.origin.y);
            }
            [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
        }
            break;
        case WTButtonImageBottom:
        {
            labelRect.origin = CGPointMake(0, commonTop);
            imageRect.origin = CGPointMake((self.frame.size.width - imageRect.size.width) / 2, CGRectGetMaxY(labelRect) + self.margin);
            labelRect.size = CGSizeMake(self.frame.size.width, labelSize.height);
            [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
            break;
        case WTButtonImageRight:
        {
            labelRect.origin = CGPointMake(commonLeft, labelRect.origin.y);
            imageRect.origin = CGPointMake(CGRectGetMaxX(labelRect) + self.margin, imageRect.origin.y);
        }
            break;
        case WTButtonText:
        {
            labelRect.origin = CGPointMake((self.frame.size.width - labelSize.width - self.edgeInset.left - self.edgeInset.right) / 2, (self.frame.size.height - labelSize.height - self.edgeInset.top - self.edgeInset.bottom)/2);
        }
            break;
        case WTButtonImage:
        {
            imageRect.origin = CGPointMake((self.frame.size.width - imageSize.width - self.edgeInset.left - self.edgeInset.right) / 2, (self.frame.size.height - imageSize.height - self.edgeInset.top - self.edgeInset.bottom)/2);
        }
            break;
        default:
            break;
    }
    [self.imageView setFrame:imageRect];
    [self.titleLabel setFrame:labelRect];
}

- (CGSize)intrinsicContentSize
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize labelSize = self.titleLabel.frame.size;
    CGSize size = CGSizeZero;
    switch (self.position) {
        case WTButtonImageBottom:
        case WTButtonImageTop:
        {
            size.width = (imageSize.width > labelSize.width ? imageSize.width : labelSize.width) + self.edgeInset.left + self.edgeInset.right;
            size.height = imageSize.height + labelSize.height + self.edgeInset.top + self.edgeInset.bottom + self.margin;
        }
            break;
        case WTButtonImageRight:
        case WTButtonImageLeft:
        {
            size.width = imageSize.width + labelSize.width + self.margin + self.edgeInset.left + self.edgeInset.right;
            size.height = (imageSize.height > labelSize.height ? imageSize.height : labelSize.height) + self.edgeInset.top + self.edgeInset.bottom;
        }
            break;
        case WTButtonText:
        {
            size = CGSizeMake(labelSize.width + self.edgeInset.left + self.edgeInset.right, labelSize.height + self.edgeInset.top + self.edgeInset.bottom);
        }
            break;
        case WTButtonImage:
        {
            size = CGSizeMake(imageSize.width + self.edgeInset.left + self.edgeInset.right, labelSize.height + self.edgeInset.top + self.edgeInset.bottom);
        }
            break;
        default:
            break;
    }
    return (size.width && size.height) ? size : [super intrinsicContentSize];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return self.intrinsicContentSize;
}

//- (void)setMargin:(CGFloat)margin
//{
//    _margin = margin;
//    [self layoutIfNeeded];
//}

#pragma mark - public
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)wt_setEnlargeEdge:(CGFloat)size
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)wt_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else{
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point)?self:nil;
}

@end
