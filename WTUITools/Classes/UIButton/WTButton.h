//
//  YHButton.h
//  TempButton
//
//  Created by Wt.Yip on 2017/7/31.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WTButtonText,
    WTButtonImage,
    WTButtonImageTop,
    WTButtonImageLeft,
    WTButtonImageBottom,
    WTButtonImageRight
} WTButtonImagePosition;

@interface WTButton : UIButton

+ (instancetype)buttonWithType:(UIButtonType)type
              andImagePosition:(WTButtonImagePosition)postion
                     andMargin:(CGFloat)margin;

+ (instancetype)buttonWithType:(UIButtonType)type
              andImagePosition:(WTButtonImagePosition)postion
                     andMargin:(CGFloat)margin
                         inset:(UIEdgeInsets)inset;

- (instancetype)initWithImagePosition:(WTButtonImagePosition)position
                            andMargin:(CGFloat)margin;
- (instancetype)initWithImagePosition:(WTButtonImagePosition)position
                            andMargin:(CGFloat)margin
                                inset:(UIEdgeInsets)inset;

// 位置
@property (nonatomic, assign) WTButtonImagePosition position;
// 間隔
@property (nonatomic, assign) CGFloat               margin;
// 内容inset
@property (nonatomic, assign) UIEdgeInsets          edgeInset;
// 放大点击区域范围
- (void)wt_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
- (void)wt_setEnlargeEdge:(CGFloat)size;

@end
