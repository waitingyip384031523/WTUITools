//
//  YHButton.m
//  TempButton
//
//  Created by Wt.Yip on 2017/7/31.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTButton.h"
#import "UIButton+EnlargeTouchAre.h"

@interface WTButton()

@end

@implementation WTButton

+ (instancetype)buttonWithType:(UIButtonType)type
              andImagePosition:(WTButtonImagePosition)postion
                     andMargin:(CGFloat)margin
{
    WTButton *button = [WTButton buttonWithType:type];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.position = postion;
    button.margin = margin;
    return button;
}

- (instancetype)initWithImagePosition:(WTButtonImagePosition)position andMargin:(CGFloat)margin
{
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.position = position;
        self.margin = margin;
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
    CGFloat commonTop = (self.frame.size.height - imageSize.height - labelSize.height - self.margin) / 2;
    CGFloat commonLeft = (self.frame.size.width - imageSize.width - labelSize.width - self.margin) / 2;
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
        case WTButtonImageBottomRight:
        {
            labelRect.origin = CGPointMake(commonLeft, labelRect.origin.y);
            imageRect.origin = CGPointMake(CGRectGetMaxX(labelRect) + self.margin, CGRectGetMaxY(labelRect) - imageSize.height - 1.f);
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
            labelRect.origin = CGPointMake((self.frame.size.width - labelSize.width) / 2, (self.frame.size.height - labelSize.height)/2);
        }
            break;
        case WTButtonImage:
        {
            imageRect.origin = CGPointMake((self.frame.size.width - imageSize.width) / 2, (self.frame.size.height - imageSize.height)/2);
        }
            break;
        default:
            break;
    }
    [self.imageView setFrame:imageRect];
    [self.titleLabel setFrame:labelRect];
}

//- (void)setMargin:(CGFloat)margin
//{
//    _margin = margin;
//    [self layoutIfNeeded];
//}

#pragma mark - public
- (void)yh_setEnlargeEdge:(CGFloat)size
{
    [self setEnlargeEdge:size];
}

- (void)yh_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    [self setEnlargeEdgeWithTop:top right:right bottom:bottom left:left];
}

@end
