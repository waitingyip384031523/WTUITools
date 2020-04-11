//
//  CALayer+XibBorderColor.m
//  Classmate
//
//  Created by Waiting.Y on 2019/10/19.
//  Copyright © 2019 Waiting.Y. All rights reserved.
//

#import "CALayer+XibBorderColor.h"


@implementation CALayer (XibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)borderColorWithUIColor
{
    self.borderColor = borderColorWithUIColor.CGColor;
}

- (UIColor *)borderColorWithUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
