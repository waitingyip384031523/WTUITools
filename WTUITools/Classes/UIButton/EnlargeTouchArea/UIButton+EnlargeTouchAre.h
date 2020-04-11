//
//  UIButton+EnlargeTouchAre.h
//  EliteShow
//
//  Created by Wt.Yip on 2018/2/26.
//  Copyright © 2018年 EliteShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchAre)

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

- (void)setEnlargeEdge:(CGFloat)size;

@end
