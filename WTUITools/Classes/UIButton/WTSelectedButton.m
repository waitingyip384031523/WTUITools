//
//  YHNoHightlighted.m
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/31.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTSelectedButton.h"

@implementation WTSelectedButton

+ (instancetype)buttonWithType:(UIButtonType)type andImagePosition:(WTButtonImagePosition)postion andMargin:(CGFloat)margin
{
    return [[WTSelectedButton alloc] initWithImagePosition:postion andMargin:margin];
}

- (instancetype)initWithImagePosition:(WTButtonImagePosition)position andMargin:(CGFloat)margin
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
