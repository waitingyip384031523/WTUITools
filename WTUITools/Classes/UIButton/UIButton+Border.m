//
//  UIButton+Border.m
//  TaxiGo
//
//  Created by 叶威廷 on 2017/4/26.
//  Copyright © 2017年 studio sans. All rights reserved.
//

#import "UIButton+Border.h"

@implementation UIButton (Border)

-(void)addTopBorderWithColor:(UIColor *)color
                    andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

-(void)addBottomBorderWithColor:(UIColor *)color
                       andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

-(void)addLeftBorderWithColor:(UIColor *)color
                     andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

-(void)addRightBorderWithColor:(UIColor *)color
                      andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

@end
