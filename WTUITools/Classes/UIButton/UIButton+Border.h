//
//  UIButton+Border.h
//  TaxiGo
//
//  Created by 叶威廷 on 2017/4/26.
//  Copyright © 2017年 studio sans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Border)

-(void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

@end
