//
//  YHNoHightlighted.m
//  HowKong
//
//  Created by Wt.Yip on 2017/7/31.
//  Copyright © 2018年 EliteShow. All rights reserved.
//

#import "YHSelectedButton.h"

@implementation YHSelectedButton

+ (instancetype)buttonWithType:(UIButtonType)type andImagePosition:(YHButtonImagePosition)postion andMargin:(CGFloat)margin
{
    return [[YHSelectedButton alloc] initWithImagePosition:postion andMargin:margin];
}

- (instancetype)initWithImagePosition:(YHButtonImagePosition)position andMargin:(CGFloat)margin
{
    self = [super initWithImagePosition:position andMargin:margin];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
