//
//  YHTabBarController.h
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMainTabBar.h"
#import "YHMainTabBarItem.h"

@class EHRotateButtonView;

@interface WTMainTabBarController : UITabBarController

@property (nonatomic, copy  ) NSArray       *leftBarItems;
@property (nonatomic, copy  ) NSArray       *rightBarItems;

@property (nonatomic, assign) CGFloat       tabBarViewHeight;
@property (nonatomic, strong) WTMainTabBar  *tabBarView;

@property (nonatomic, strong) UIView *centerView;

//- (void)onlyShowCenterView:(BOOL)isShow;

@end
